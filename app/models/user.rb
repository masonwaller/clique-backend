class User < ApplicationRecord
    has_secure_password

    has_many :user_categories
    has_many :categories, through: :user_categories

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
