require 'spec_helper'

#As a marketeer
#So that I can enjoy myself away from the daily grind
#I would like to be able to play rock/paper/scissors

feature 'Playing a single player game' do

  before do
    visit('/players/new')
    fill_in 'player_name', with: 'Dan'
    click_button('submit')
  end

  scenario 'winning the game' do
    opponent_choose(:scissors)
    player_choose(:rock)
    expect(page).to have_content("RPS_Bot chose scissors")
    expect(page).to have_content("Dan wins!")
  end

  scenario 'losing the game' do
    opponent_choose(:paper)
    player_choose(:rock)
    expect(page).to have_content("RPS_Bot chose paper")
    expect(page).to have_content("RPS_Bot wins!")
  end

  scenario 'a draw' do
    opponent_choose(:rock)
    player_choose(:rock)
    expect(page).to have_content("It's a draw!")
  end

  def player_choose(weapon)
    expect(current_path).to eq('/game/new')
    choose("Rock")
    click_on("Play!")
    expect(current_path).to eq('/game/result')
    expect(page).to have_content("Dan chose #{weapon}")
  end

  def opponent_choose(weapon)
    allow(Weapon).to receive(:random).and_return(Weapon.arm(weapon))
  end
end
