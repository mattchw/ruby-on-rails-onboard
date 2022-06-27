require 'rails_helper'

RSpec.describe User do
  describe '#GetUserService' do
    it "returns user count and users" do
      res = GetUserService.call()
      expect(res[:count]).to be >= 0
      expect(res[:rows].length()).to be >= 0 
    end
  end

  describe '#CreateUserService' do
    subject { CreateUserService.call(params) }

    context 'when param is noraml' do
      let(:params) {
        {
          first_name: 'John',
          last_name: 'Doe',
          bio: 'Bio',
          age: 20,
          gender: 'Male',
        }
      }

      it "return newly created user" do
        res = subject
        expect(res).to be_a(User)
        expect(res[:first_name]).to eq(params[:user][:first_name])
      end
    end
  end

  # describe '#GetOneUserService' do
  #   it "return user by id" do
  #     params = ActionController::Parameters.new(
  #       user: {
  #         first_name: 'John',
  #         last_name: 'Doe',
  #         bio: 'Bio',
  #         age: 20,
  #         gender: 'Male',
  #       }
  #     )
  #     new_user = CreateUserService.call(params)
  #     user = GetOneUserService.call(new_user[:_id])
  #     expect(user).to be_a(User)
  #     expect(user[:first_name]).to eq(params[:user][:first_name])
  #   end
  # end
end