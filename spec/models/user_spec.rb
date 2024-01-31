require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'return valid when all attributes are valid' do
      user = User.new(email: 'test@test.com', name: 'Test', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
    it 'return inValid when password is not at least 8 chars' do
      user = User.new(email: 'test@test.com', name: 'Test', password: 'passwor', password_confirmation: 'passwor')
      expect(user).to be_invalid
    end
    it 'return inValid with a duplicate email' do
      User.create(email: 'test@test.com', name: 'Test', password: 'password', password_confirmation: 'password')
      user = User.new(email: 'test@test.com', name: 'Test', password: 'password', password_confirmation: 'password')
      expect(user).to be_invalid
    end
    it 'returns inValid without an email' do
      user = User.new(email: nil, name: 'Test', password: 'password', password_confirmation: 'password')
      expect(user).to be_invalid
    end
    it 'return inValid if password does not match' do
      user = User.new(email: nil, name: 'Test', password: 'password', password_confirmation: 'passwor')
      expect(user).to be_invalid
    end
  end
  describe '.authenticate_with_credentials' do
    it 'returns the user if valid'do 
      user = User.create(email: 'test@test.com', name: 'Test', password: 'password', password_confirmation: 'password')
      auth_user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(auth_user).to eq(user)
    end 
  it 'return true when there is leading spaces on email' do
    user = User.create(email: 'test@test.com', name: 'Test', password: 'password', password_confirmation: 'password')
    auth_user = User.authenticate_with_credentials('  test@test.com', 'password')
    expect(auth_user).to eq(user)
  end 
  end
end
