class Service < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables

  # acts_as_taggable_on :service_types


  has_one :user
  def change_oil(car, next_visit="year")
    if car.log
      car.log.oil_change = Date.today
    end

  end

  def refuel(car, next_visit="year")
    if car.log
      car.log.patrol = Date.today
    end
  end
end
