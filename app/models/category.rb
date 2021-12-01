class Category < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :entities

  validates :name, presence: true, length: { maximum: 150 }
  validates :icon, presence: true

  def amount
    entities.sum('amount')
  end
end
