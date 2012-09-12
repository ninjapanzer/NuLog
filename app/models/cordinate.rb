class Cordinate < ActiveRecord::Base
  belongs_to :record_storage
  attr_accessible :mouseX, :mouseY, :screenX, :screenY
  
  def mouse(cords)
    corda = processCords cords
    puts corda
    write_attribute :mouseX, corda[0]
    write_attribute :mouseY, corda[1]
    nil
  end
  
  def screen(cords)
    corda = processCords cords
    write_attribute :screenX, corda[0]
    write_attribute :screenY, corda[1]
  end
  
  #Takes in a string of "x,y" and returns and array of floats [x.0,y.0]
  def processCords(cords)
    cords.split(",").map do |c|
      c.to_f
    end
  end
end
