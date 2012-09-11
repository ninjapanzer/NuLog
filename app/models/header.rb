class Header < ActiveRecord::Base
  belongs_to :record_storage
  attr_accessible :name, :value
end
