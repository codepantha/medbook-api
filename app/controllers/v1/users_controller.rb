class V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json
  end

  def show
      user = User.find_by_id(params[:id])
    if user != nil
      render json: user.to_json
    else
      render json: { status: 'error', code: 200, "message": "Couldn't find Quote with 'id'=#{params[:id]}" }
    end
  end

  def create
    new_user = User.new(name: params[:name])
    if new_user.save
      render status: 201, json: {
        message: "New user created successfully."
      }
    else
      render json: { errors: new_user.errors,
                     status: 422 }
    end
  end
end
