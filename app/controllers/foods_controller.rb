class FoodsController < ApplicationController
  autocomplete :food, :name, :extra_data => [:id]
  
  def index
  end

  def show
    @food = Food.find(params[:id])
  end

  def import
    Food.import(params[:file])
    redirect_to root_url
  end
end
