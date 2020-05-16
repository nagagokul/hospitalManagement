require 'rails_helper'

RSpec.describe Doctor, type: :model do
  context 'validation tests' do 
  
  it 'ensures name presence' do
    FactoryGirl.build(:doctor, name: nil).should_not be_valid
  #  expect(doctor).to eq(false)
  end
  
  it 'ensures specialisation presence' do
    FactoryGirl.build(:doctor, specialisation: nil).should_not be_valid
   # expect(doctor).to eq(false)
  end
  
  it 'ensures department presence' do
  FactoryGirl.build(:doctor, department: nil).should_not be_valid
   # expect(doctor).to eq(false)
  end

  it 'has a valid doctor' do
    doctor = FactoryGirl.build(:doctor).should be_valid
    
  end

  end
  
  context 'scope tests' do 
    
    before(:each) do
      FactoryGirl.create(:doctor, active: true).save
      FactoryGirl.create(:doctor, active: true).save
      FactoryGirl.create(:doctor, active: true).save
      FactoryGirl.create(:doctor, active: false).save
      FactoryGirl.create(:doctor, active: false).save
      FactoryGirl.create(:doctor, active: false).save
    end

    it 'should return active users' do
      expect(Doctor.active_users.size).to eq(3)
    end

    it 'should return inactive users' do
      expect(Doctor.inactive_users.size).to eq(3)
    end

  end
end
