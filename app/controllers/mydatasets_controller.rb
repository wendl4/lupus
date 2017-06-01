require 'csv'
require 'json'

class MydatasetsController < ApplicationController

	def index
		@datasets = Dataset.all
	end

	def new

	end

	def edit
		@dataset_id = params["id"]
		@dataset_name = Dataset.find_by_id(params["id"]).name
		@Fields = DatasetField.where(:dataset_id => @dataset_id)
	end

	def delete
		fields = DatasetField.where(:dataset_id => params["id"])
		fields.each do |field|
			field.destroy
		end
		records = DatasetRecord.where(:dataset_id => params["id"])
		records.each do |record|
			record.destroy
		end
		dataset = Dataset.find_by_id(params["id"])
		dataset.destroy
		redirect_to action: "index"
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
			redirect_to action: "index"
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
		redirect_to action: "index"
	end

	def edit_columns
		types = params["type"]
		d_id = params["dataset_id"]
		titles = params["title"]
		if params["name"].length > 0
			dataset = Dataset.find_by_id(d_id)
			dataset.name = params["name"]
			dataset.save
		end
		types.each do |fid, ftype|
			field = DatasetField.find_by_id(fid)
			field.field_type = ftype
			if titles[fid].length > 0
				field.title = titles[fid]
			end
			field.save
		end
		redirect_to({ :action=>'index' }, :alert => "Upravene")
	end
	
end
