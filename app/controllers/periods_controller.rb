class PeriodsController < ApplicationController
  before_action :set_period, only: %i[ show ]

  def show
  end

  def buscar
    @parametro = params[:parametro]
    @period = Period.find_by(start_year: @parametro)

    if @period
      render 'show'
    else
      redirect_to periods_path
    end
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new(period_params)

    respond_to do |format|
      if @period.save
        format.html { redirect_to period_url(@period)}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_period
      @period = Period.find(params[:id])
    end

    def period_params
      params.require(:period).permit(:start_year, :end_year)
    end
end
