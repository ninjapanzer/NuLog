class Header < ActiveRecord::Base
  belongs_to :record_storage
  attr_accessible :name, :value
  
  def self.extract(headers)
    JSON.parse headers
  end
end
