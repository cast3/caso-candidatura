class CandidaturesController < ApplicationController
  before_action :set_candidature, only: %i[ show ]

  def show
  end

  def buscar
    @parametro = params[:parametro]
    @candidature = Candidature.find_by(codeInscription: @parametro)

    if @candidature
      render 'show'
    else
      redirect_to candidatures_path
    end
  end

  def new
    @candidature = Candidature.new
  end

  def create
    @candidature = Candidature.new(candidature_params)
 
    respond_to do |format|
      if @candidature.save
        parties = params[:candidature][:party_ids].reject(&:blank?)

        parties.each do |party_id|
          @candidature_parties = CandidatureParty.create(candidature_id: @candidature.id, party_id: party_id)
        end

        @candidature = Candidature.includes(:parties).find(@candidature.id)
        format.html { redirect_to candidature_url(@candidature) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  

  private
    def set_candidature
      @candidature = Candidature.includes(:parties).find(params[:id])
    end

    def candidature_params
      params.require(:candidature).permit(:codeInscription, :dateInscription, :candidate_id, :municipality_id, :period_id, :party_ids)
    end
end
