class RecordStorage < ActiveRecord::Base
  belongs_to :host
  has_one :cordinate
  has_many :headers
end
