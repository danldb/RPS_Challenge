require 'player'

describe Player do
  let(:player){ described_class.new(name: 'Bob', weapon_class: weapon_class) }
  let(:challenger){ Computer.new }
  let(:weapon_class){ double :weapon_class, new: weapon }
  let(:weapon){ double :weapon }

  it 'has a name' do
    expect(player.name).to eq('Bob')
  end

  it 'defeats a challenger' do
    allow(weapon).to receive(:>).and_return(true)
    player.choose(weapon)

    expect(player.defeats?(challenger)).to eq(true)
  end
end

describe Computer do

  subject(:computer){ described_class.new(weapon_class: weapon_class) }
  let(:weapon_class){ double :weapon, new: weapon }
  let(:weapon){ double :weapon }

  it 'has a name' do
    expect(computer.name).to eq('RPS_Bot')
  end

  it 'gets a list of available weapons' do
    expect(weapon_class).to receive(:types).and_return([:rock])

    computer.choose
  end
end
