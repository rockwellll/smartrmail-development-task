require 'rails_helper'

describe 'posting a new event process' do
  it 'should open a modal to add new event, fill in the inputs and add to the page' do
    visit '/events' do
      expect(page).to have_content('New Events')

      click_on 'New Events'

      expect(page).to have_content('Create New Event')

      fill_in 'Name', with: 'Hackathon'
      fill_in 'description', with: 'Some random new description'
      fill_in 'begins_at', with: '2020-08-18'
      fill_in 'ends_at', with: '2020-08-20'
      fill_in 'location', with: "Erbil, Iraq"

      click_on 'Create'

      expect(page).to !have_content('Create New Event')
      expect(page).to have_content('Hackathon')
    end
  end

  it 'should not allow the submit of an event that has an empty field' do
    visit '/events' do
      click_on 'New Events'

      fill_in 'Name', with: ''
      fill_in 'description', with: 'Some random new description'
      fill_in 'begins_at', with: '2020-08-18'
      fill_in 'ends_at', with: '2020-08-20'
      fill_in 'location', with: "Erbil, Iraq"

      click_on 'Create'

      expect(page).to have_css('.border-red-500')
    end
  end

  it 'should clear the end date input if the start date is bigger than the end date' do
    visit '/events' do
      click_on 'New Events'

      fill_in 'begins_at', with: '2020-08-18'
      fill_in 'ends_at', with: '2020-08-20'

      fill_in 'begins_at', with: '2020-08-22'

      expect(find_field('end_date').value).to eq ''
    end
  end
end