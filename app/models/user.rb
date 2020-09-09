require 'bcrypt'
class User < ApplicationRecord
    has_many :tasks
    has_many :quotes
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
end
