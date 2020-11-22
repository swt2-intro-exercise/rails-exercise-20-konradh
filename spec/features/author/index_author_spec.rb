require 'rails_helper'

describe "Index author page", type: :feature do
  before :all do
    create(:author)
  end

  it "should render without error" do
    visit authors_path
  end

  it "should have a link to the new author page" do
    visit authors_path
    expect(page).to have_link "New", href: new_author_path
  end

  it "should display a table containing name and homepage for all authors" do
    visit authors_path

    Author.all.each do |author|
      expect(page).to have_text author.first_name
      expect(page).to have_text author.last_name
      expect(page).to have_text author.homepage
      expect(page).to have_link href: author_path(author)
    end
  end

  it "should have edit links for all authors" do
    visit authors_path
    Author.all.each do |author|
      expect(page).to have_link("Edit", href: edit_author_path(author))
    end
  end
end