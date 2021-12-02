class Entity < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :categories

  validates :name, :amount, :categories, presence: true, length: { maximum: 150 }
  validates :amount, numericality: { greater_than: 0 }
end
