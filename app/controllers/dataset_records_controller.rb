class DatasetRecordsController < ApplicationController
  def index
  end

  def show
  	rec =DatasetRecord.find(params[:id])
  	@record_id = params[:id]
  	@record = JSON.parse(rec.data)
  	@dataset_id = rec.dataset_id
  	@rating = rec.showRating
    @comments = Comment.where(:record_id => @record_id)
  end

  def add_rating
  	stars = params["star"]
  	record_id = params["record_id"]
  	dataset_id = params["dataset_id"]
  	rate = Rate.new()
  	rate.record_id = record_id
  	rate.dataset_id = dataset_id
  	rate.rate_value = stars
  	rate.save
  	redirect_to action: "show", id: params["record_id"]
  end

  def add_comment
    record_id = params["record_id"]
    author = params["author"]
    text = params["text"]
    comment = Comment.new()
    comment.author = author
    comment.text = text
    comment.record_id = record_id
    comment.save
    redirect_to action: "show", id: params["record_id"]
  end
end
