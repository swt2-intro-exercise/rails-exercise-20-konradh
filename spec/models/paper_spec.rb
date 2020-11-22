require 'rails_helper'

describe Paper, type: :model do
  it "is not valid without title, venue and year" do
    paper = Paper.new({})
    expect(paper).to be_invalid
  end

  it "is valid if all attributes are present" do
    paper = create(:paper)
    expect(paper).to be_valid
  end
end
