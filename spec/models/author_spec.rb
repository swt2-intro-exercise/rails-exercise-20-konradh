require 'rails_helper'

describe Author, type: :model do

  it "should have a first name, last name and a homepage" do
    author = create(:author)
    expect(author.first_name).to eq "Alan"
    expect(author.last_name).to eq "Turing"
    expect(author.homepage).to eq "http://wikipedia.de/Alan_Turing"
  end

  describe Author::name do
    it "should return the full name of the author" do
      author = create(:author)
      expect(author.name).to eq "Alan Turing"
    end
  end

end