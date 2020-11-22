require 'rails_helper'

describe Author, type: :model do
  before :all do
    @alan = create(:author)
  end

  it "should have a first name, last name and a homepage" do
    expect(@alan.first_name).to eq "Alan"
    expect(@alan.last_name).to eq "Turing"
    expect(@alan.homepage).to eq "http://wikipedia.de/Alan_Turing"
  end

  describe Author::name do
    it "should return the full name of the author" do
      expect(@alan.name).to eq "Alan Turing"
    end
  end

end