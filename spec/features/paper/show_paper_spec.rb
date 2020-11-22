require 'rails_helper'

describe "Show paper page", type: :feature do
  it "displays the author's full names" do
    paper = create(:paper)
    visit paper_path(paper)

    paper.authors.each do |author|
      expect(page).to have_text author.name
    end
  end
end