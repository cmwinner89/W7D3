require 'rails_helper'


RSpec.describe UsersController, type: :controller do

    subject(:user) do
        User.create!(
            username: "collinwinner1",
            password: "password123"
        )
    end

    describe "GET #index" do
        it "should render user index" do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
        it "should render user show page" do
            get :show, params: { id: user.id }
            expect(response).to render_template(:show)
        end
    end

    describe "POST #create" do
        # before(:each) do
            # create(:user)

            # allow(subject).to receive(:current_user).and_return(User.last)
        # end
        
        context 'with valid params' do
            before(:each) do
                post :create, params: { user: { username: 'jaewooklim1', password: 'password' } }
            end
            it 'should create a user' do
                expect(User.last.username).to eq('jaewooklim1')
                expect(User.last.password).to eq(nil)
            end
        end

        context 'with invalid params' do
            before(:each) do
                post :create, params: { user: { username: '', password: 'passw'} }
            end

            it 'should render new template' do
                expect(response).to render_template(:new)
                # expect(response).to have_http_status(422)
            end            

            it 'adds error to flash' do
                expect(flash[:errors]).to be_present
            end
        end
    end
end