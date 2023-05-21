class Service < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables

  # acts_as_taggable_on :service_types

  # t.datetime "oil_change"
  # t.datetime "water_removal"
  # t.datetime "cabin_filter_change"
  # t.datetime "breaks_liquid_change"
  # t.datetime "freeze_liquid_change"
  # t.datetime "driving_belt_change"
  # t.datetime "chain_grm_change"
  # t.datetime "oil_filter_change"
  # t.datetime "air_filter_change"
  # t.string "registration_number"
  # t.datetime "ensuranse_expiration"
  # t.datetime "driver_lisence_expiration"
  # t.datetime "inspection"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.integer "car_id"
  has_one :user
  def oil_change(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.oil_change = Date.today
      Work.create(car_id: car.id,service_work: "oil change", next_appointment: next_visit)
    end

  end

  def water_removal(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.water_removal = Date.today
      Work.create(car_id: car.id,service_work: "water_removal", next_appointment: next_visit)
    end

  end

  def cabin_filter_change(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.cabin_filter_change = Date.today
      Work.create(car_id: car.id,service_work: "cabin_filter_change", next_appointment: next_visit)
    end

  end

  def breaks_liquid_change(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.breaks_liquid_change = Date.today
      Work.create(car_id: car.id,service_work: :breaks_liquid_change, next_appointment: next_visit)
    end

  end

  def freeze_liquid_change(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.freeze_liquid_change = Date.today
      Work.create(car_id: car.id,service_work: "freeze_liquid_change", next_appointment: next_visit)
    end

  end

  def driving_belt_change(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.driving_belt_change = Date.today
      Work.create(car_id: car.id,service_work: "driving_belt_change", next_appointment: next_visit)
    end

  end

  def chain_grm_change(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.chain_grm_change = Date.today
      Work.create(car_id: car.id,service_work: "chain_grm_change", next_appointment: next_visit)
    end

  end

  def oil_filter_change(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.oil_filter_change = Date.today
      Work.create(car_id: car.id,service_work: "oil_filter_change", next_appointment: next_visit)
    end

  end

  def air_filter_change(car, next_visit=1.year.since(Time.now))
    if car.log
      car.log.air_filter_change = Date.today
      Work.create(car_id: car.id,service_work: "air_filter_change", next_appointment: next_visit)
    end

  end

  def inspection(car, next_visit=4.year.since(Time.now))
    if car.log
      car.log.inspection = Date.today
      Work.create(car_id: car.id,service_work: "inspection", next_appointment: next_visit)
    end

  end




end
