class Car < ApplicationRecord
  has_one :log
  belongs_to :user
  belongs_to :service
end
