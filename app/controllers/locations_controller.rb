class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :set_company_id, only: [:create]
  
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :latitude, :longitude)
  end

  def set_company_id
    if current_user
      @company = current_user.company
      @location.update_attribute(:company_id, @company.id)
    end
  end

end
