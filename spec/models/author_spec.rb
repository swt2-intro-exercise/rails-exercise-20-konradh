require 'rails_helper'

describe Author, type: :model do
  it "should have a first name, last name and a homepage" do
    @alan = create(:author)
    expect(@alan.first_name).to eq "Alan"
    expect(@alan.last_name).to eq "Turing"
    expect(@alan.homepage).to eq "http://wikipedia.de/Alan_Turing"
  end

  it "have a method 'name' returning the full name of the author" do
    @alan = create(:author)
    expect(@alan.name).to eq "Alan Turing"
  end

  it "should be valid only if it has a last name" do
    with_last = Author.new({ last_name: "1" })
    expect(with_last).to be_valid
  end

  it "should be invalid if it has no last name" do
    without_last = Author.new({ first_name: "1", homepage: "2" })
    expect(without_last).to be_invalid
  end
  
end