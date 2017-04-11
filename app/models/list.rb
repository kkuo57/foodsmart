class List < ApplicationRecord
  belongs_to :user
  has_many :list_entries, dependent: :destroy
  validates :name, presence: true
  validates_inclusion_of :isFavorite, :in => [true, false]
end
