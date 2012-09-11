class Host < ActiveRecord::Base
  has_many :record_storages
  attr_accessible :domain, :uri
end
