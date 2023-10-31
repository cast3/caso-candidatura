class PartiesController < ApplicationController
  before_action :set_party, only: %i[ show ]

  def show
  end

  def buscar
    @parametro = params[:parametro]
    @party = Party.find_by(identification: @parametro)

    if @party
      render 'show'
    else
      redirect_to parties_path
    end
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to party_url(@party) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_party
      @party = Party.find(params[:id])
    end

    def party_params
      params.require(:party).permit(:identification, :name)
    end
end
