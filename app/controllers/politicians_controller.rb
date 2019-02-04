class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show]

  def index
    @politicians = Politician.all
  end

  def show

  end


  def set_politician
    @politician = Politician.find(params[:id])
  end
end
