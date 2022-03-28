require 'rails_helper'

RSpec.describe 'Doctors', type: :request do
  before :each do
    @doctor = Doctor.create(name: 'Prom', specialty: 'Pediatrics', date_of_birth: '2000-06-03',
                            profile_pic: 'http://dfk.com', experience: 5, consultation_fee: 4300,
                            bio: 'I am a fighter')
    @doctor2 = Doctor.create(name: 'Prom', specialty: 'Pediatrics', date_of_birth: '2000-06-03',
                             profile_pic: 'http://dfk.com', experience: 5, consultation_fee: 4300,
                             bio: 'I am a fighter')
  end

  describe 'GET /api/v1/doctors' do
    it 'returns http success' do
      get api_v1_doctors_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'GET /api/v1/doctors/:id' do
    it 'returns http success' do
      get api_v1_doctor_path(@doctor)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/doctors' do
    it 'create a post and return http created' do
      post '/api/v1/doctors',
           params: { doctor: { name: 'Sheila', specialty: 'Cardiothoracic surgery', date_of_birth: '1997-06-03',
                               profile_pic: 'http://dfk.com', experience: 3, consultation_fee: 4300,
                               bio: 'I am a fighter' } }
      expect(response).to have_http_status(201)
    end
  end

  describe 'DELETE /api/v1/doctors/:id' do
    it 'deletes a post and returns http status 204' do
      delete api_v1_doctor_path(@doctor)
      expect(response).to have_http_status(204)
    end
  end
end
