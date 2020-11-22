require 'rails_helper'

describe "Edit author page", type: :feature do
  before :each do
    @alan = create(:author)
  end

  it "renders without error" do
    visit edit_author_path(@alan)
  end

  it "updates an author's values" do
    visit edit_author_path(@alan)
    page.fill_in "author[last_name]", with: "Kay"
    page.fill_in "author[homepage]", with: "https://en.wikipedia.org/wiki/Alan_Kay"
    find("input[type=submit]").click

    @alan.reload
    expect(@alan.last_name).to eq "Kay"
  end

end