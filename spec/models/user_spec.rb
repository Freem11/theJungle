require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
   
    it "should generate a user if password and password confirmation match" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: "heyo",
        password_confirmation: "heyo"
        )
   
      expect(@user).to be_valid
    end

    it "should not generate a user if password and password confirmation dont match" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: "heyo",
        password_confirmation: "mayo"
        )
   
      expect(@user).to_not be_valid
    end

    it "should not generate a user if password and password confirmation are nil" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: nil,
        password_confirmation: nil
        )
   
      expect(@user).to_not be_valid
    end

    it "should not generate a user if password is nil" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: nil,
        password_confirmation: "mayo"
        )
   
      expect(@user).to_not be_valid
    end

    it "should not generate a user if password confirmation is nil" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: "heyo",
        password_confirmation: nil
        )
   
      expect(@user).to_not be_valid
    end

    it "should not generate a user if email is already in Db" do
      @user1 = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "d@gmail.com",
        password: "heyo",
        password_confirmation: "heyo"
        )
      @user1.save

      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "D@gmail.com",
        password: "heyo",
        password_confirmation: "heyo"
        )

      expect(@user).to_not be_valid
    end

    it "should not generate a user if email is nil" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: nil,
        password: "heyo",
        password_confirmation: "heyo"
        )
   
      expect(@user).to_not be_valid
    end
    it "should not generate a user if first name is nil" do
      @user = User.new(
        first_name: nil,
        last_name: "Testington",
        email: "test@test.com",
        password: "heyo",
        password_confirmation: "heyo"
        )
   
      expect(@user).to_not be_valid
    end
    it "should not generate a user if last name is nil" do
      @user = User.new(
        first_name: "Test",
        last_name: nil,
        email: "test@test.com",
        password: "heyo",
        password_confirmation: "heyo"
        )
   
      expect(@user).to_not be_valid
    end

    it "should not generate a user if passowrd is too short (4)" do
      @user = User.new(
        first_name: "Test",
        last_name: nil,
        email: "test@test.com",
        password: "hey",
        password_confirmation: "hey"
        )
   
      expect(@user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it "should login if email and password are good" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: "heyo",
        password_confirmation: "heyo"
        )
        @user.save

        @session = User.authenticate_with_credentials("test@test.com", "heyo")

      expect(@session).to_not be_nil
    end

    it "should reject if email is not good" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: "heyo",
        password_confirmation: "heyo"
        )
        @user.save

        @session = User.authenticate_with_credentials("testy@test.com", "heyo")

      expect(@session).to be_nil
    end

    it "should reject if password is not good" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: "heyo",
        password_confirmation: "heyo"
        )
        @user.save

        @session = User.authenticate_with_credentials("test@test.com", "heyoa")

      expect(@session).to be_nil
    end

    it "should reject if both are not good" do
      @user = User.new(
        first_name: "Test",
        last_name: "Testington",
        email: "test@test.com",
        password: "heyo",
        password_confirmation: "heyo"
        )
        @user.save

        @session = User.authenticate_with_credentials("testy@test.com", "heyoa")

      expect(@session).to be_nil
    end
 
 
  end

end

