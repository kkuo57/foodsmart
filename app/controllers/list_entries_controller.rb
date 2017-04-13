class ListEntriesController < ApplicationController

  def new
    @list_entry = ListEntry.new(list_id: params[:list_id])
  end

  def create
    list_entry = ListEntry.new(list_entries_params)
    list_entry[:food_id] = params[:list_entry][:food_id]
    list_entry[:quantity] = params[:list_entry][:quantity]
    if logged_in? && list_entry.save
      flash[:success] = "Added Successfully"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Unable to add item"
      redirect_to root_path
    end
  end

  def update
    list_entry = ListEntry.where(id: params[:id]).take
    if !logged_in?  || list.current_user != list.user
      flash[:error] = "Nope"
      redirect_to root_path
    else
      list_entry.update(list_entries_params)
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @list_entry.destroy
    flash[:success] = "Deleted List Successfully"
    redirect_to user_path(@list_entry.list.user)
  end

  private

  def list_entries_params
    params.permit(:quantity, :list_id, :food_id, :id)
  end
end
