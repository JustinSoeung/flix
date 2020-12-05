class Movie < ApplicationRecord

    RATINGS = %w(G PG PG-13 R NC-17)

    has_many :reviews, -> {order(created_at: :desc)}, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :fans, through: :favorites, source: :user
    has_many :critics, through: :reviews, source: :user
    has_many :characterizations, dependent: :destroy
    has_many :genres, through: :characterizations

    validates :title, :released_on, :duration, presence: true

    validates :description, length: { minimum: 25 }

    validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

    validates :image_file_name, format: {
        with: /\w+\.(jpg|png)\z/i,
        message: "must be a JPG or PNG image"
      }

    validates :rating, inclusion: { in: RATINGS }


    scope :released, -> { where("released_on < ?", Time.now).order("released_on desc") }
    scope :upcoming, -> { where("released_on > ?", Time.now).order("released_on asc")}
    scope :recent, ->(max=5) { released.limit(max)}
    scope :flops, ->(max=1) { released.where("total_gross < ?", 225_000_000).order(total_gross: :asc).limit(max)}
    scope :grossed_less_than, ->(max) {where("total_gross <= ?", max)}
    scope :grossed_more_than, ->(max) {where("total_gross >= ?", max)}
    scope :hits, ->(max=5) {released.where("total_gross >= ?", 300_000_000).order("total_gross desc").limit(max)}


    def flop?
        total_gross.blank? || total_gross < 225_000_000
    end





    def self.recently_added
        order("created_at desc").limit(3)
    end

    def average_stars
        reviews.average(:stars) || 0.0
    end

    def average_stars_as_percent
        (self.average_stars / 5.0) * 100
    end
end
