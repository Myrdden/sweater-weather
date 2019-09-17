class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true

  after_initialize :create_key
  def create_key
    self.update(api_key: SecureRandom.hex)
  end

  def self.validate(key)
    User.where(api_key: key).exists?
  end
end
