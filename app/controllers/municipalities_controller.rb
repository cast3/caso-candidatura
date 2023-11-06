class MunicipalitiesController < ApplicationController
  before_action :set_municipality, only: %i[ show ]

  def index
  end

  def show
  end

  def buscar
    @parametro = params[:parametro]
    @municipality = Municipality.find_by(daneCode: @parametro)

    if @municipality
      render 'show'
    else
      redirect_to municipalities_path
    end
  end

  def new
    @municipality = Municipality.new
  end

  def create
    @municipality = Municipality.new(municipality_params)

    respond_to do |format|
      if @municipality.save
        format.html { redirect_to municipality_url(@municipality)}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_municipality
      @municipality = Municipality.find(params[:id])
    end

    def municipality_params
      params.require(:municipality).permit(:daneCode, :name)
    end
end
