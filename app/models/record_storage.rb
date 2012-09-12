class RecordStorage < ActiveRecord::Base
  has_one :cordinate
  has_many :headers
end
