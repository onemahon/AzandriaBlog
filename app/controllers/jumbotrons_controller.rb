class JumbotronsController < ApplicationController

  before_action :get_jumbotron, only: :show

  def show
  end

  private

  def get_jumbotron
    @jumbotron = Jumbotron.find(params[:id])
  end
end
