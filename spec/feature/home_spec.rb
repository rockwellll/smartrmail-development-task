require 'rails_helper'

describe "the home process" do
  it "should get home" do
    visit('/events')
    expect(page).to have_content("Prev")
    puts 'cool, the login form page says Login'
  end
end