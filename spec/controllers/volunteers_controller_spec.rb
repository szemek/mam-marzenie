require 'spec_helper'

describe VolunteersController do

  describe 'GET index' do
    it 'returns http success' do
      get 'index'
      expect(response).to be_success
    end
  end

  describe 'GET show' do
    it 'assigns the requested dream as @user' do
      user = User.create! valid_attributes
      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end
end
