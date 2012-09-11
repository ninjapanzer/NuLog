class RecordStorage < ActiveRecord::Base
  has_one :cordinates
  has_many :headers
  # attr_accessible :title, :body
end
