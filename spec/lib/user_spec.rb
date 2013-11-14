require 'spec_helper'

describe Marmite::User do
  subject{ described_class.new("asmega") }

  it 'fetches the users email' do
    subject.email.should == "asmega@ph-lee.com"
  end

  describe :repos do
    it 'returns some repos' do
      subject.repos.should_not be_empty
    end

    it 'includes a known repo' do
      subject.repos.map(&:name).should include("dotfiles")
    end
  end
end
