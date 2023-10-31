class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show ]

  def show
  end

  def buscar
    @parametro = params[:parametro]
    @candidate = Candidate.find_by(identification: @parametro)

    if @candidate
      render 'show'
    else
      redirect_to candidates_path
    end
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to candidate_url(@candidate) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(:identification, :name)
    end
end
