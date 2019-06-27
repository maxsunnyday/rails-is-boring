class Author < ApplicationRecord
    has_many :author_books
    has_many :books, through: :author_books
    validates :name, presence: true
    validates :birth_year, presence: true
    validates :birth_year, numericality: { less_than_or_equal_to: Time.now.year, greater_than: 0 }
end
