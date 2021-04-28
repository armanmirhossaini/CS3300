require 'rails_helper'
RSpec.feature "Portfolios", type: :feature do
  context "Create new project" do
    before(:each) do
      visit new_portfolio_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Portfolio"
      expect(page).to have_content("Portfolio was successfully created")
    end
    scenario "should fail" do
      click_button "Create Portfolio"
      expect(page).to have_content("Description can't be blank")
    end
  end
  context "Update Portfolio" do
    let(:portfolio) { Portfolio.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_portfolio_path(portfolio)
    end
    
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Portfolio"
      expect(page).to have_content("Portfolio was successfully updated")
    end
    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Portfolio"
      expect(page).to have_content("Description can't be blank")
    end
  end
  context "Remove existing portfolio" do
    let!(:portfolio) { Portfolio.create(title: "Test title", description: "Test content") }
    scenario "remove portfolio" do
      visit portfolios_path
      click_link "Destroy"
      expect(page).to have_content("Portfolio was successfully destroyed")
      expect(Portfolio.count).to eq(0)
    end
  end
end
