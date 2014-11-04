require 'rails_helper'

feature "Events" do

  scenario "User creates an event" do
    visit root_path
    expect(page).to have_no_content("The best event ever")

    click_on "New Event"
    fill_in "Description", with: "The best event ever"
    click_on "Create Event"

    expect(page).to have_content("The best event ever")
  end

  scenario "User updates an event" do
    Event.create!(description: "Yeah!")

    visit root_path
    expect(page).to have_no_content("No!")

    click_on "edit"
    fill_in "Description", with: "No!"
    click_on "Update Event"

    expect(page).to have_content("No!")
  end

  scenario "User deletes an event" do
    Event.create!(description: "delete me")

    visit root_path
    expect(page).to have_content("delete me")

    click_on "delete"

    expect(page).to have_no_content("delete me")
  end

end
