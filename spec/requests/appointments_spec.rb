require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  describe "GET api/v1/users/:user_id/appointments" do
    it "returns appointments with user_id" do
      FactoryBot.create(:user, name: "Michael", id: 1)
      FactoryBot.create(:user, name: "Paulina", id: 2)
      FactoryBot.create(:appointment, city: 'USA', appointment_date: '2020/2/3', user_id: 1)
      FactoryBot.create(:appointment, city: 'Canada', appointment_date: '2020/1/3', user_id: 1)

      get '/api/v1/users/1/appointments'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eql(3)
    end
  end

  describe 'POST /appointment' do
      it "creates a new appointment failed without user_id" do
        FactoryBot.create(:user, name: "Paulina", id: 2)
        
        post '/api/v1/users/2/appointments', params: { appointment: { appointment_date: Date.new(2021, 1, 3), city: 'Indiana'}}
        expect(response).to have_http_status(:unprocessable_entity)
      end
  end
end
