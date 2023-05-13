# as visitor
# when i visit the artists index page
# and click a button 'delete' next to an artist
# then i am redirected back to the artists index page
#and i no longer see that artist

require 'rails_helper'

RSpec.describe 'Artist delete' do 
  it 'can delete artist from index page' do 
    shitty_beatles = Artist.create!(name: 'Shitty Beatles')

    visit '/artists'
    click_button 'Delete'
    expect(current_path).to eq('/artists')
    expect(page).to_not have_content('Shitty Beatles')
  end
end