class User < ApplicationRecord
  validates :name, presence: { message: 'Name must not be empty' }, uniqueness: true
  validates :name, length: { minimum: 5, maximum: 50, message: 'must be between 5 and 50 characters' }

  has_many :appointments
end
