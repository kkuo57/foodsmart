class ListEntry < ApplicationRecord
  belongs_to :list
  belongs_to :food
  validates :quantity, presence:true
end
