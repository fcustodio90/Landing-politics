class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show, :lock, :unlock]

  def index
    @politicians = Politician.all
  end

  def show

  end

  def lock
    @politician.save_state
    redirect_to root_path
  end

  def unlock
    @politician.recover_state
    redirect_to root_path
  end


  def set_politician
    @politician = Politician.find(params[:id])
  end
end
