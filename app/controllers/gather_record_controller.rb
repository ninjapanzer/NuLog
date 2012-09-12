class GatherRecordController < ApplicationController
  def gather
    
    submitHash = request.GET
    
    #HEADER Object
    head = Header.new
    #END HEADER
    
    #CORDINATE Object
    cord = Cordinate.new
    cord.mouse submitHash[:mouse]
    cord.screen submitHash[:screen]
    #END CORDINATE
    
    #RECORD_STORAGE Object
    rs = RecordStorage.new
    rs.cordinate = cord
    rs.headers.push
    #END RECORD_STORAGE
    
    #HOST object
    @host = Host.new
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
