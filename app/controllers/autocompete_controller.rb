class AutocompleteController < ApplicationController
  def service_types
    term = params[:term].downcase
    service_types = Service.tag_counts_on(:service_types).where('LOWER(name) LIKE ?', "%#{term}%")
    render json: service_types.pluck(:name)
  end
end
