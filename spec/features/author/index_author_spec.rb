require 'rails_helper'

describe "Index author page", type: :feature do

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
      expect(page).to have_link("edit", href: edit_author_path(author))
    end
  end

  it "should have links to delete each author individually" do
    visit authors_path
    Author.all.each do |author|
      expect(page).to have_link("delete", href: author_path(author))
    end
  end

  it "deletes an author from the database if the delete link is clicked" do
    create(:author)
    visit authors_path
    authors_count = Author.count
    find("a[href='#{author_path(Author.first)}'][data-method='delete']").click
    expect(Author.count).to eq authors_count - 1
  end
end