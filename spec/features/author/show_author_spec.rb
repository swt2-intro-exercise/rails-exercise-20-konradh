require 'rails_helper'

describe "Show author page", type: :feature do

  it "should render without error" do
    @alan = create(:author)
    visit author_path(@alan)
  end

  it "should display first name, last name and homepage" do
    @alan = create(:author)
    visit author_path(@alan)
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
  end
end