require 'player'
require 'weapon'

describe Player do
  let(:player){ described_class.new(name: 'Bob', weapon_class: weapon_class) }
  let(:challenger){ described_class.new }
  let(:weapon_class){ class_double Weapon, arm: weapon }
  let(:weapon){ instance_double Weapon }

  it 'defeats a challenger' do
    allow(weapon).to receive(:>).and_return(true)
    player.choose(weapon)

    expect(player.defeats?(challenger)).to eq(true)
  end
  
  it 'asks for a random weapon' do
    expect(weapon_class).to receive(:random)

    player.choose
  end
end
