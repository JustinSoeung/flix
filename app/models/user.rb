class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ },
                    uniqueness: {case_sensitive: false }

  validates :password, length: {minimum: 10, allow_blank: true}

  validates :username, presence:true,
                    format: { with: /\A[A-Z0-9]+\z/i },
                    uniqueness: {case_sensitive: false}
  
  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end
  
end
