class GroupsController < ApplicationController

  def index
    render json: Group.with_empties(params[:with_empties]), status: 200
  end

end
