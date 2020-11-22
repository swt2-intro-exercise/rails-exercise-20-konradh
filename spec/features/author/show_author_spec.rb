require 'rails_helper'

describe "Show author page", type: :feature do
  before :all do
    @alan = create(:author)
  end

  it "should render without error" do
    visit author_path(@alan)
  end
end