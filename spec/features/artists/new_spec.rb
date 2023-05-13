require 'rails_helper'

# as a visitor
# when i visit artists index
# click on 'New Artist'
# then my current path is /artists/new
# i fill in artists name
# click create artist
# I am redirected to the new artists show page

RSpec.describe 'artist creation' do 
  it 'links to the new page from artist index' do 
    visit '/artists'
    click_link("New Artist")
    expect(current_path).to eq('/artists/new')
  end

  it 'can create a new artist' do 
    visit '/artists/new'
    fill_in("Name", with: 'Prince')
    click_button("Create Artist")

    expect(current_path).to eq("/artists")
    expect(page).to have_content("Prince")
  end
end