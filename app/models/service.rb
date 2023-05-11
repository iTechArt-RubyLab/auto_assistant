class Service < ApplicationRecord

  belongs_to :user
  def change_oil(car, next_visit="year")
    if car.log
      car.log.oil_change = Date.today
    end

  end
end
