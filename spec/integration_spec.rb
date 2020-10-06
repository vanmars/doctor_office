require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a specialty path', {:type => :feature}) do
  it('creates specialty path and then goes to the specialty page') do
    visit('/specialties')
    click_on('Add a new specialty')
    fill_in('specialty_name', :with => 'Neurology')
    click_on('Go!')
    expect(page).to have_content('Neurology')
  end

  it('creates page for specific specialty') do
    visit('/specialties')
    click_on('Add a new specialty')
    fill_in('specialty_name', :with => 'Neurology')
    click_on('Go!')
    click_on('Neurology')
    expect(page).to have_content('Add a Doctor')
  end
end