require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DreamsController do

  # This should return the minimal set of attributes required to create a valid
  # Dream. As you add validations to Dream, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DreamsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all dreams as @dreams" do
      dream = Dream.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:dreams)).to eq([dream])
    end
  end

  describe "GET show" do
    it "assigns the requested dream as @dream" do
      dream = Dream.create! valid_attributes
      get :show, {:id => dream.to_param}, valid_session
      expect(assigns(:dream)).to eq(dream)
    end
  end

  describe "GET new" do
    it "assigns a new dream as @dream" do
      get :new, {}, valid_session
      expect(assigns(:dream)).to be_a_new(Dream)
    end
  end

  describe "GET edit" do
    it "assigns the requested dream as @dream" do
      dream = Dream.create! valid_attributes
      get :edit, {:id => dream.to_param}, valid_session
      expect(assigns(:dream)).to eq(dream)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Dream" do
        expect {
          post :create, {:dream => valid_attributes}, valid_session
        }.to change(Dream, :count).by(1)
      end

      it "assigns a newly created dream as @dream" do
        post :create, {:dream => valid_attributes}, valid_session
        expect(assigns(:dream)).to be_a(Dream)
        expect(assigns(:dream)).to be_persisted
      end

      it "redirects to the created dream" do
        post :create, {:dream => valid_attributes}, valid_session
        expect(response).to redirect_to(Dream.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dream as @dream" do
        # Trigger the behavior that occurs when invalid params are submitted
        Dream.any_instance.stub(:save).and_return(false)
        post :create, {:dream => { "title" => "invalid value" }}, valid_session
        expect(assigns(:dream)).to be_a_new(Dream)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Dream.any_instance.stub(:save).and_return(false)
        post :create, {:dream => { "title" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested dream" do
        dream = Dream.create! valid_attributes
        # Assuming there are no other dreams in the database, this
        # specifies that the Dream created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Dream).to receive(:update).with({ "title" => "MyString" })
        put :update, {:id => dream.to_param, :dream => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested dream as @dream" do
        dream = Dream.create! valid_attributes
        put :update, {:id => dream.to_param, :dream => valid_attributes}, valid_session
        expect(assigns(:dream)).to eq(dream)
      end

      it "redirects to the dream" do
        dream = Dream.create! valid_attributes
        put :update, {:id => dream.to_param, :dream => valid_attributes}, valid_session
        expect(response).to redirect_to(dream)
      end
    end

    describe "with invalid params" do
      it "assigns the dream as @dream" do
        dream = Dream.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Dream.any_instance.stub(:save).and_return(false)
        put :update, {:id => dream.to_param, :dream => { "title" => "invalid value" }}, valid_session
        expect(assigns(:dream)).to eq(dream)
      end

      it "re-renders the 'edit' template" do
        dream = Dream.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Dream.any_instance.stub(:save).and_return(false)
        put :update, {:id => dream.to_param, :dream => { "title" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dream" do
      dream = Dream.create! valid_attributes
      expect {
        delete :destroy, {:id => dream.to_param}, valid_session
      }.to change(Dream, :count).by(-1)
    end

    it "redirects to the dreams list" do
      dream = Dream.create! valid_attributes
      delete :destroy, {:id => dream.to_param}, valid_session
      expect(response).to redirect_to(dreams_url)
    end
  end

end
