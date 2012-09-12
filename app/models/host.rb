class Host < ActiveRecord::Base
  has_one :record_storage
  attr_accessible :domain, :uri
end
