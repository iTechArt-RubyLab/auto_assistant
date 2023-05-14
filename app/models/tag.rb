class Tag < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :services, through: :taggables
end
