class WorkstationsController < ApplicationController
  # GET /workstations
  # GET /workstations.json
  def index
   
   # this will be a hash of params and their values
   # e.g. model => MacBookPro4,1
    @filters = params.except("action","controller")
    
   
    # there must be a nicer way to do this?
    if @filters.keys.include?("model")
      @workstations = Workstation.where("model = ?", @filters.fetch("model"))
      
    elsif @filters.keys.include?("OS")
      @workstations = Workstation.where("OS = ?", @filters.fetch("OS"))
    else
      @workstations = Workstation.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workstations }
    end
  end
  

  # GET /workstations/1
  # GET /workstations/1.json
  def show
    @workstation = Workstation.find(params[:id])

    @versions = @workstation.versions

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workstation }
    end
  end

  # GET /workstations/new
  # GET /workstations/new.json
  def new
    @workstation = Workstation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workstation }
    end
  end

  # GET /workstations/1/edit
  def edit
    @workstation = Workstation.find(params[:id])
  end

  # POST /workstations
  # POST /workstations.json
  def create
    @workstation = Workstation.new(params[:workstation])

    respond_to do |format|
      if @workstation.save
        format.html { redirect_to @workstation, notice: 'Workstation was successfully created.' }
        format.json { render json: @workstation, status: :created, location: @workstation }
      else
        format.html { render action: "new" }
        format.json { render json: @workstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workstations/1
  # PUT /workstations/1.json
  def update
    @workstation = Workstation.find(params[:id])

    respond_to do |format|
      if @workstation.update_attributes(params[:workstation])
        format.html { redirect_to @workstation, notice: 'Workstation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workstations/1
  # DELETE /workstations/1.json
  def destroy
    @workstation = Workstation.find(params[:id])
    @workstation.destroy

    respond_to do |format|
      format.html { redirect_to workstations_url }
      format.json { head :no_content }
    end
  end
  
  def import
    Workstation.import(params[:file])
    redirect_to root_url, notice: "Workstations imported"
  end
end
