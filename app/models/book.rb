class Book < ApplicationRecord
  has_one_attached :book
  belong_to :user
end
