class User < ApplicationRecord
  validates :name, presence: { message: 'must not be empty' }
  validates :name, length: { minimum: 5, maximum: 50, message: 'must be between 5 and 50 characters' }
end
