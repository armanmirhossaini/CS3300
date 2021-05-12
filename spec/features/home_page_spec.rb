=begin
require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Portfolios")
  #pending "add some scenarios (or delete) #{__FILE__}"
  end
end

=end