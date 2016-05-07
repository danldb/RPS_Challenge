require 'weapon'

describe Weapon do
  it 'returns a list of weapon types' do
    expect(described_class.types).to include(:rock)
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

        let(:scissors){ described_class.new(:scissors) }
        let(:rock){ described_class.new(:rock) } 
        let(:paper){ described_class.new(:paper) }
        subject(:weapon){ described_class.new(type) }

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
