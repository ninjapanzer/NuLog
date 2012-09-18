class GatherRecordController < ApplicationController
  def gather
    
    submitHash = request.GET
    
    #HEADER Object
    head = Header.create
    #END HEADER
    
    #CORDINATE Object
    cord = Cordinate.create
    cord.mouse submitHash[:mouse]
    cord.screen submitHash[:screen]
    #END CORDINATE
    
    #RECORD_STORAGE Object
    rs = RecordStorage.create
    rs.cordinate = cord
    rs.headers.push head
    #END RECORD_STORAGE
    
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
