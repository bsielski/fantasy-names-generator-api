class GroupsController < ApplicationController

  def index
    render json: Group.with_empties(ActiveModel::Type::Boolean.new.cast(params[:with_empties])), status: 200
  end

end
