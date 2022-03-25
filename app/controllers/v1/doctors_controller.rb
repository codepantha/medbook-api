class V1::DoctorsController < ApplicationController
  def index
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
