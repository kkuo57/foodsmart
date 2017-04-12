class ListsController < ApplicationController
  before_action :set_list,        only: [:show, :edit, :update, :destroy]
  before_action :is_current_user, only: [       :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
    @list = List.new(user_id: params[:user_id])
  end

  def edit
  end

  def create
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
    list = list_params
    list[:user_id] = params[:user_id]
    @list = List.new(list)
    if @list.save
      redirect_to new_list_list_entry_path(@list)
    else
      flash[:error] = "Invalid List Info"
      redirect_to user_path(current_user)
    end
  end

  def update
    @list.update(list_params)
    redirect_to user_path(@list.user)
  end

  def destroy
    if @list.isFavorite
      flash[:error] = "Can't Delete Your List of Favorites"
      redirect_to user_path(current_user)
    else
      @list.destroy
      flash[:success] = "Deleted List Successfully"
      redirect_to user_path(@list.user)
    end
  end

  private
  def is_current_user
    @list = List.find_by_id(params[:id])
    if !current_user || current_user != @list.user
      redirect_to root_path
    end
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :user_id, :isFavorite)
  end
end
