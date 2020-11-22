require 'rails_helper'

describe "New author page", type: :feature do

  it "should render without error" do
    visit new_author_path
  end

  describe "new author form" do
    before :all do
      @alan = create(:author)
    end

    it "should have a field for first name, last name and homepage of an author" do
      visit new_author_path
      expect(page).to have_field('author[first_name]')
      expect(page).to have_field('author[last_name]')
      expect(page).to have_field('author[homepage]')
    end

    it "should save the values on submit" do
      authors_count = Author.count

      visit new_author_path
      page.fill_in "author[first_name]", with: @alan.first_name
      page.fill_in "author[last_name]", with: @alan.last_name
      page.fill_in "author[homepage]", with: @alan.homepage
      find("input[type=submit]").click

      expect(Author.count).to eq authors_count + 1
    end
  end

end
