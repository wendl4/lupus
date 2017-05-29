require 'csv'
require 'json'

class MydatasetsController < ApplicationController

	def index
	end

	def new

	end

	def import
		if  params.has_key?("file")
			csv_text = params["file"].read.force_encoding("UTF-8")
			csv = CSV.parse(csv_text, :headers => true)
			dataset = Dataset.new(name: params["name"])
			dataset.save
			@dataset_id = dataset.id
			first = true
			csv.each do |row|
			if first == true
			 	@keys = row.to_hash.keys
			 	first = false
			end
		     data_record = DatasetRecord.new(data:row.to_hash.to_json, dataset_id: dataset.id)
		    unless data_record.save
		        puts data_record.errors.full_messages
			end
		end
		else
			redirect_to action: index
		end
	end

	def add_columns
		@types = params["type"]
		d_id = params["dataset_id"]
		titles = params["title"]
		@types.each do |fname, ftype|
			field = DatasetField.new(field_name: fname, field_type: ftype, title:titles[fname], dataset_id: Integer(d_id) )
			field.save
		end
		redirect_to action: index
	end
	
end
