require 'spec_helper'

describe Marmite::User, :vcr do
  subject{ described_class.new("asmega") }

  it 'fetches the users email' do
    subject.email.should == "asmega@ph-lee.com"
  end

  context 'when an unknown user' do
    it "raises User::NotFound exception" do
      expect{ described_class.new("ihopethisuserdoenotexist") }.to raise_error(Marmite::User::NotFound)
    end
  end

  describe :repos do
    it 'returns some repos' do
      subject.repos.should_not be_empty
    end

    it 'includes a known repo' do
      subject.repos.map(&:name).should include("dotfiles")
    end
  end

  describe :languages do
    it 'returns some languages' do
      subject.languages.should == {
        "Erlang" => 1,
        "JavaScript" => 3,
        "Ruby" => 22,
        "VimL" => 1 }
    end
  end

  describe :favourite_language do
    it 'returns Ruby' do
      subject.favourite_language.should == "Ruby"
    end
  end
end
