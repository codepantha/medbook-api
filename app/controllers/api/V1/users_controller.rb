class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: { status: 'Success', message: 'Users fetched succesfully', data: users }, status: :ok
  end

  def show
    user = User.find_by_id(params[:id])
    if user.nil?
      render json: { status: 'Error', code: 200, message: "Couldn't find user with 'id'=#{params[:id]}" }
    else
      render json: { status: 'Success', message: 'User fetched succesfully', data: user }, status: :ok
    end
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      render status: 201, json: {
        status: 'Success',
        message: 'New user created successfully.'
      }
    else
      render json: { errors: new_user.errors,
                     status: 422 }
    end
  end

  private

  def user_params
    params.permit(:name)
  end
end
