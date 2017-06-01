class Dataset < ApplicationRecord

	def showRating
		count = 0
		sum = 0
		records = DatasetRecord.where(:dataset_id => self.id)
		records.each do |record|
			rating = record.showRating
			if not rating == 0 
				count = count + 1
				sum = sum + rating
			end
		end
		if count == 0
			return 0
		else
			return sum/count
		end
	end
end
