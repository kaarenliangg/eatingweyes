class Recipe < ApplicationRecord
    has_one :user
    has_and_belongs_to_many :categories
end