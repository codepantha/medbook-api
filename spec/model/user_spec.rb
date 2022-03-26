require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Alex Ramos') }

  before do
    User.create!(name: 'Mateo Flores')
    User.create!(name: 'Zoe Maria')
    subject.save
  end

  it 'expects name to not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'has 3 users' do
    expect(User.count).to eq(3)
  end

  it 'Name too short' do
    subject.name = 'Li'
    expect(subject).to_not be_valid
  end

  it 'Name too long' do
    subject.name = 'Alejandro Ramos Santo Amr Amhed Michael Oladele Promise Eze'
    expect(subject).to_not be_valid
  end

  it 'Unique names' do
    subject.name = 'Zoe Maria'
    expect(subject).to_not be_valid
  end
end
