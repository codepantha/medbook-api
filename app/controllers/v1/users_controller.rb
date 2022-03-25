class V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json
  end

  def create
    render json: { doctors: [
      {
        name: 'Jason Scotch',
        specialty: 'Cardio thoracic surgeon'
      },
      {
        name: 'Mary Medelin',
        specialty: 'Neurosurgeon'
      }
    ] }.to_json
  end
end
