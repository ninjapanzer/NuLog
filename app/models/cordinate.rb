class Cordinate < ActiveRecord::Base
  belongs_to :record_storage
  attr_accessible :mouseX, :mouseY, :screenX, :screenY
end
