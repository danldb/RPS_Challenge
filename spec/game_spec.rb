require 'game'

describe Game do

  subject(:game){ described_class.new }
  let(:player){ double :player }
  let(:computer){ double :computer }

  before do
    game.add(player)
    game.add(computer)
  end

  it 'builds a class instance' do
    allow(Game).to receive(:new).and_return(game)
    Game.build

    expect(Game.current).to eq game
  end


  specify 'player can win' do
    allow(player).to receive(:defeats?).with(computer).and_return(true)

    expect(game.winner).to eq(player)
  end

  specify 'player can lose' do
    allow(player).to receive(:defeats?).with(computer).and_return(false)
    allow(computer).to receive(:defeats?).with(player).and_return(true)

    expect(game.winner).to eq(computer)
  end

  specify 'there is no winner' do
    allow(player).to receive(:defeats?).with(computer).and_return(false)
    allow(computer).to receive(:defeats?).with(player).and_return(false)

    expect(game.winner).to be_nil
  end

  specify 'player 1 chooses a weapon' do
    allow(computer).to receive(:choose).with(nil)
    expect(player).to receive(:choose).with(:rock)

    game.play(player_one_weapon: :rock)
  end

end
