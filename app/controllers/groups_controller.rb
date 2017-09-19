class GroupsController < ApplicationController

  def index
    render json: Group.all, status: 200
  end

end
