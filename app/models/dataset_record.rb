require 'elasticsearch/model'
class DatasetRecord < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	def showRating
		count = 0
		sum = 0
		rates = Rate.where(:record_id => self.id)
		rates.each do |rate|
			if not rate.rate_value.nil?
				count = count + 1
				sum = sum + rate.rate_value
			end
		end
		if count == 0
			return 0
		else
			return sum/count
		end
	end
end
