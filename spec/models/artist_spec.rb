require 'rails_helper'

RSpec.describe Artist do 
  it {should have_many :songs}

  describe 'instance methods' do 
    describe '#average_song_length' do 
      before :each do 
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 24)
        @cab_driver = @prince.songs.create!(title: 'Lady Cab Driver', length: 9045, play_count: 24)
      end

      it 'returns the average song length' do 

        expect(@prince.average_song_length).to eq(4945)
      end
    end
  end
end
