require 'spec_helper'

# As a marketeer
# So that I can see my name in lights
# I would like to register my name before playing an online game

feature 'registering a players name' do
  scenario 'adding a player' do
    visit('/players/new')
    fill_in :player_name, with: 'Dan'
    click_button('submit')
    expect(page).to have_content 'Dan'
  end

  scenario 'player is redirected to re-enter name if no player name is present' do

  end
end
