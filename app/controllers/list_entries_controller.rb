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

  private
  def list_entries_params
    params.permit(:quantity, :user_id, :food_id, :id)
  end
end
