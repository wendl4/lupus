require 'json'
class SearchController < ApplicationController
  def index
    if params[:term].nil?
    	@results = []
    else
    	@results = DatasetRecord.search params[:term]
    end
  end
end
