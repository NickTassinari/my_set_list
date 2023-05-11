require 'rails_helper'

RSpec.describe 'the songs show page' do 
  #as a visitor
  #when i visit /somgs/1 (where 1 is the id of a song in my database)
  #then i see that songs title and artist
  #and i do not see any of the other songs in my database

  it 'displays song title' do
    artist = Artist.create!(name: "Carly Rae Jepson")
    song = artist.songs.create!(title: "I Really Like You", length: 288, play_count: 2445345)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 4555, play_count: 24534590)
    
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end 

  it 'displays name of artist for song' do 
    artist = Artist.create!(name: "Carly Rae Jepson")
    song = artist.songs.create!(title: "I Really Like You", length: 288, play_count: 2445345)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 4555, play_count: 24534590)
    
    visit "/songs/#{song.id}"
    # save_and_open_page 
    expect(page).to have_content(artist.name)
  end
end