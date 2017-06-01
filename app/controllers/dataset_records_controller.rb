class DatasetRecordsController < ApplicationController
  def index
  end

  def show
  	@record_id = params[:id]
  	@record = JSON.parse(DatasetRecord.find(params[:id]).data)
  	@dataset_id = DatasetRecord.find(params[:id]).dataset_id
  end
end
