ActiveAdmin.register Car do


  permit_params :make, :model, :year, :fuel_type, :engine_size, :transmission, :body_type, :mileage, :notes, :user_id

  
end
