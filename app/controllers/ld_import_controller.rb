class LdImportController < ApplicationController
  
  def index
    #TODO refactor to own controller!
    # this is both a GET and POST action, so handle GET first
    @ps = params
    
      respond_to do |format|
        format.html { render action: "index" }
      end
  end
  
  def create
    @ps = params
    
    # POST received!
    # we get the file and pass it to a model for validation
    @ld_import = LdImport.new(params.fetch(:ld_import))
    
    if @ld_import.valid?
      flash[:notice] = "done!"
    else 
      flash[:notice] = "errors"
      render action: "create"
    end
  end
  
  
end
