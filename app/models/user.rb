class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, length: { in: 4..12 }
end
