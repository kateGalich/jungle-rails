require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'can create user' do
      @user = User.create(first_name: 'Kate', last_name: 'Galich', email: "kate@galich", password: '123456', password_confirmation: '123456')
      expect(@user).to be_valid
    end

    it 'password and password_confirmation need to match' do
      @user = User.create(first_name: 'Kate', last_name: 'Galich', email: "kate@galich", password: '123456', password_confirmation: '1234567')
      expect(@user).to_not be_valid
    end

    it 'Email must be unique' do
      @user1 = User.create(first_name: 'Kate', last_name: 'Galich', email: "kate@galich", password: '123456', password_confirmation: '123456')
      @user2 = User.create(first_name: 'Kate', last_name: 'Galich', email: "kate@Galich", password: '123456', password_confirmation: '123456')
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
    end

    it 'Email is required' do
      @user = User.create(first_name: 'Kate', last_name: 'Galich', password: '123456', password_confirmation: '123456', email: nil)
      expect(@user).to_not be_valid
    end
    
    it 'first name is required' do
      @user = User.create(last_name: 'Galich', email: "kate@galich", password: '123456', password_confirmation: '123456')
      expect(@user).to_not be_valid
    end
    
    it 'last name is required' do
      @user = User.create(first_name: 'Kate', email: "kate@galich", password: '123456', password_confirmation: '123456')
      expect(@user).to_not be_valid
    end      

    it 'The password must have a minimum length' do
      @user = User.create(first_name: 'Kate', last_name: 'Galich', email: "kate@galich", password: '123', password_confirmation: '123')
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'can not log in user with wrong email' do
      result = User.authenticate_with_credentials( "not@here.com", '123456')
      expect(result).to be_nil
    end

    it 'can not log in user with wrong password' do
      user = User.create(first_name: 'Kate', last_name: 'Galich', email: "kate@galich", password: '123456', password_confirmation: '123456')
      user.save
        result = User.authenticate_with_credentials( "kate@galich", '1234567')
        expect(result).to be_nil
      end

    it 'authenticate user with spases in the email' do
      user = User.create(first_name: 'Kate', last_name: 'Galich', email: "example@domain.com", password: '1234567', password_confirmation: '1234567')
      user.save
      result = User.authenticate_with_credentials( "  example@domain.com  ", '1234567')
      expect(result).to_not be_nil
    end

    it 'authenticate user with the wrong case for their email' do
      user = User.create(first_name: 'Kate', last_name: 'Galich', email: "example@domain.Com", password: '1234567', password_confirmation: '1234567')
      user.save
      result = User.authenticate_with_credentials( "example@domain.CoM", '1234567')
      expect(result).to_not be_nil
    end

  end

end
