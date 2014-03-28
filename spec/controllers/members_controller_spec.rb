require 'spec_helper'

describe MembersController do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @request.env['HTTP_REFERER'] = root_path

    @user = User.new({
      email: 'email@email.com',
      fullname: 'Testowy',
      region: 'Kraków',
      password: 'qwerty123',
      password_confirmation: 'qwerty123'
    })
    @user.save!

    sign_in @user
  end

  context '#create' do
    it 'adds new member' do
      expect {
        post :create, member: { dream_id: 1 }
      }.to change{Member.count}.by(1)
    end
  end

  context '#destroy' do
    before do
      @member = Member.create(user_id: @user.id, dream_id: 1)
    end

    it 'removes member' do
      expect {
        delete :destroy, id: @member.id
      }.to change{Member.count}.by(-1)
    end
  end
end
