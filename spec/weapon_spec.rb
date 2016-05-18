require 'weapon'

describe Weapon do
  it 'returns a random weapon' do
    weapons = described_class.constants.map {|constant| described_class.const_get(constant) }
    expect(described_class.random).to satisfy {|weapon| weapons.include?(weapon) }
  end

  it 'does not allow new to be called' do
    expect{ described_class.new }.to raise_error(NoMethodError)
  end

  {:rock     => {:rock     => false,
                 :paper    => false,
                 :scissors => true},
   :paper    => {:rock     => true,
                 :paper    => false,
                 :scissors => false},
   :scissors => {:rock     => false,
                 :paper    => true,
                 :scissors => false}}.each do |type, outcome|

      context "#{type}" do

        let(:scissors){ described_class.arm(:scissors) }
        let(:rock){ described_class.arm(:rock) } 
        let(:paper){ described_class.arm(:paper) }
        subject(:weapon){ described_class.arm(type) }

        specify "vs rock" do
          expect(weapon > rock).to eq(outcome[:rock])  
        end

        specify "vs paper" do
          expect(weapon > paper).to eq(outcome[:paper])  
        end

        specify "vs scissors" do
          expect(weapon > scissors).to eq(outcome[:scissors])  
        end
      end
  end
end
