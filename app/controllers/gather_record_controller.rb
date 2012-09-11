class GatherRecordController < ApplicationController
  def gather
    
    submitHash = request.GET
    submitHash[:host]
    host = Host.new
    host.domain = submitHash[:host]
    host.uri = submitHash[:uri]
    host.save
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
