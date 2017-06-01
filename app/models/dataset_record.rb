require 'elasticsearch/model'
class DatasetRecord < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
