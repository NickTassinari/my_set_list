require 'rails_helper'

#as a user
#when i visit an artists song index
#then i see the titles of all of that artists songs
#and i see that each title is a link to the songs show page
RSpec.describe 'Artists songs index' do 
  before :each do 
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 24)
    @cab_driver = @prince.songs.create!(title: 'Lady Cab Driver', length: 9045, play_count: 24)
  end
  it 'shows all the titles of songs for the artist' do 
   
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@cab_driver.title)
  end 
  it 'links to each songs show page' do 
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title 

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows the average song length for the artist' do 
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 4945")
  end
end