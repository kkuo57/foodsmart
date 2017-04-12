class FoodsController < ApplicationController
  autocomplete :food, :name, :extra_data => [:id]
  def index
  end

  def show
    @food = Food.find(params[:id])
  end

  def search
    query = params[:q]
    @foods = Food.search query, match: :word_start
  end

  def autocomplete
    render json: Food.search(params[:q], {
      fields: ["name"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)
  end

  def import
    Food.import(params[:file])
    redirect_to root_url
  end
end
