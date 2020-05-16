require 'rails_helper'

RSpec.describe Patient1, type: :model do
  context 'validation tests' do 
  
    it 'ensures name presence' do
      FactoryGirl.build(:patient1, name: nil).should_not be_valid
    #  expect(patient1).to eq(false)
    end
    
    #it 'ensures specialisation presence' do
    #  FactoryGirl.build(:doctor, specialisation: nil).should_not be_valid
     # expect(doctor).to eq(false)
   # end
    
   # it 'ensures department presence' do
    #FactoryGirl.build(:doctor, department: nil).should_not be_valid
     # expect(doctor).to eq(false)
   # end
  
    it 'has a valid patient' do
      patient1 = FactoryGirl.build(:patient1).should be_valid
      
    end
  
    end
    
    context 'scope tests' do 
      
      before(:each) do
        FactoryGirl.create(:patient1, active: true).save
        FactoryGirl.create(:patient1, active: false).save
        FactoryGirl.create(:patient1, active: true).save
        FactoryGirl.create(:patient1, active: false).save
        FactoryGirl.create(:patient1, active: true).save
        FactoryGirl.create(:patient1, active: false).save
      end
  
      it 'should return active users' do
        expect(Patient1.active_users.size).to eq(3)
      end
  
      it 'should return inactive users' do
        expect(Patient1.inactive_users.size).to eq(3)
      end
  
    end
end
