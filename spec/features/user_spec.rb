require 'rails_helper'

feature 'User' do 
  scenario "sign up" do 
    visit signup_path

    fill_in "user[first_name]",  with: "So"
    fill_in "user[last_name]",  with: "Nia"
    fill_in "user[email]",  with: "sonia@example.com"
    fill_in "user[password]",  with: "sonia123"
    click_button "Sign Up!"
    expect(page).to have_text "MoRiRi"
    expect(page).to have_text "Signed in as So"
  end  
end
