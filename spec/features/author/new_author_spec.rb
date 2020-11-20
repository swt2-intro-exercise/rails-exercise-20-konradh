require 'rails_helper'

describe "New author page", type: :feature do

  it "should render withour error" do
    visit new_author_path
  end

  describe "input fields" do
    specify "first name" do
      visit new_author_path
      expect(page).to have_field('author[first_name]')
    end
    specify "last name" do
      visit new_author_path
      expect(page).to have_field('author[last_name]')
    end
    specify "homepage" do
      visit new_author_path
      expect(page).to have_field('author[homepage]')
    end
  end

end
