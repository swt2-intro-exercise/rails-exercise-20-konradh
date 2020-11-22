require 'rails_helper'

describe "Edit paper page", type: :feature do
  it "has a multi-select for selection authors" do
    paper = create(:paper)
    visit edit_paper_path(paper)

    page.find("select[multiple]")
  end
end