class PoliticiansController < ApplicationController
  def index
    @politicians = Politician.all
  end

  def show
  end
end
