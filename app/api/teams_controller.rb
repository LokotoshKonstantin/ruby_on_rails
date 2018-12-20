class Api::TeamsController < ApplicationController

  def index
    render json: Team.all.to_json
  end
end