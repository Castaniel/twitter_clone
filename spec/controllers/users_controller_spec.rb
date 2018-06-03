require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'valid' do
      it '' do
        post :create, params: { user: { first_name: 'First Name', last_name: 'Last Name', password: 'password', password_confirmation: 'password', email: 'user@gmail.com' } }

        expect(response).to have_http_status(302)
      end
    end

    context 'invalid' do
      it '' do
        post :create, params: { user: { password: '', first_name: '', last_name: '', email:'' } }

        expect(assigns(:user).errors.full_messages).to eq(["Password can't be blank", "Email can't be blank", "Email is invalid", "First name can't be blank", "Last name can't be blank"])
        expect(assigns(:user).errors.count).to eq(5)
        expect(response).to render_template(:new)
      end
    end
  end
end