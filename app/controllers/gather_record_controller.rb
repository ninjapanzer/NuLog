class GatherRecordController < ApplicationController
  def gather
    
    submitHash = request.GET
    
    #CORDINATE Object
    cord = Cordinate.create
    cord.mouse submitHash[:mouse]
    cord.screen submitHash[:screen]
    #END CORDINATE
    
    #RECORD_STORAGE Object
    rs = RecordStorage.create
    rs.cordinate = cord
    #END RECORD_STORAGE
    
    #HEADER Object
    henum = Header.extract submitHash[:headers]
    henum.each do |key,value|
      head = Header.create
      head.name = key
      head.value = value
      rs.headers.push head
    end
    #END HEADER
    
    #HOST object
    @host = Host.create
    @host.domain = submitHash[:host]
    @host.uri = submitHash[:uri]
    @host.record_storage = rs
    @host.save
    #END HOST
    
    respond_to do |format|
      format.html
      format.json{
        render :json => request.GET,
        :content_type=>'application/json'
      }
    end
  end
  
  def show
    @shows = Host.find(:all)
  end
end
