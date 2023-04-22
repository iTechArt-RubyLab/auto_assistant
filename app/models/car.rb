class Car < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_one :log
end
