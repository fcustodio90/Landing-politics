class PoliticiansController < ApplicationController
  def index
    @politicians = Politician.all
  end

  def show
    raise
  end
end
