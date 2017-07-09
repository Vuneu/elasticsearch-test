require 'elasticsearch/model'

class Article < ApplicationRecord
  searchkick
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end