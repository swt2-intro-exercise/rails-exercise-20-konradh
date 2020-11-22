require 'rails_helper'

describe "Show author page", type: :feature do
  before :all do
    @alan = create(:author)
  end

  it "should render without error" do
    visit author_path(@alan)
  end

  it "should display first name, last name and homepage" do
    visit author_path(@alan)
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
  end
end