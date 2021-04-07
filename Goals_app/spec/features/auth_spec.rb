require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do

  scenario 'has a new user page' do
    expect(page).to have_content('signup')
    expect(page).to have_content('username')
    expect(page).to have_content('password')
  end 
  feature 'signing up a user', type: :feature do
    scenario 'shows username on the homepage after signup' do 
        expect(current_path).to eq(user_path(User.last))
        expect(page).to have_content("jaewook")
    end
  end
end

feature 'logging in', type: :feature do
  scenario 'shows username on the homepage after login' do
    expect(page).to have_content("jaewook")
    expect(current_path).to eq(user_url(User.last))
  end
end

feature 'logging out', type: :feature do
  scenario 'begins with a logged out state' do
    expect(current_path).to eq(session_new_url)
    expect(page).to have_content('signup')
    expect(page).to have_content('login')

  end

  scenario 'doesn\'t show username on the homepage after logout' do 
    expect(page).to_not have_content(User.last.username)
  end

end