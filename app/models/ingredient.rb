class Ingredient < ApplicationRecord
  validates :name, presence: true, allow_blank: false, uniqueness: true
  has_many :doses

  def self.all_names
    all.map { |ingredient| ingredient.name }
  end
end
