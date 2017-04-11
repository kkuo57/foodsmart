class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def import
    Food.import(params[:file])
    redirect_to root_url
  end
end
