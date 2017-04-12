class ListEntriesController < ApplicationController

  def create
    list_entry = ListEntry.new(list_entries_params)
    if logged_in? && list_entry.save
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

  private

  def list_entries_params
    params.permit(:quantity, :list_id, :food_id, :id)
  end
end
