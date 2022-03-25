class V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json
  end

  def show
    user = User.find(params[:id])
    render json: user.to_json
  end

  def create
    new_user = User.create(name: params[:name])
    render json: new_user.to_json
  end
end
