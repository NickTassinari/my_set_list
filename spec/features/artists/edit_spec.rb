require 'rails_helper'

#as visitor
# i visit artists index
# click edit next to an artist
#then i am taken to an edit artist form
# when i enter a new name for the artist 
# and click abutton to 'Update Artist'
# Then i am redirected back to the artists index
# and i see the updated name

RSpec.describe 'Edit artist' do 
  it 'links to edit page' do 
    artist = Artist.create!(name: "Sword II")
    visit '/artists'
    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")    
  end

  it 'can edit the artist' do 
    artist = Artist.create!(name: "Sword 3")
    visit "/artists"
    expect(page).to have_content("Sword 3")
    click_button "Edit Sword 3"

    fill_in 'Name', with: 'Sword II'
    click_button "Update Artist"

    expect(current_path).to eq("/artists")
    expect(page).to have_content("Sword II")
  end
end