module EquipmentsHelper
	def get_available_for(expiry_date)
		current_time = Time.now
		difference = expiry_date - current_time
		values = Hash.new
		difference > 0 ? values[:status] = "active" : values[:status] = "closed"
		values[:minutes] = ((difference/60)%60).floor
		values[:hours] = ((difference/(60 * 60))%24).floor
		values[:days] = (difference/(60 * 60 * 24)).floor
		return values
	end
end