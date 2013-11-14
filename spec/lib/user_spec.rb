require 'spec_helper'

describe Marmite::User do
  subject{ described_class.new("asmega") }

  it 'fetches the users email' do
    subject.email.should == "asmega@ph-lee.com"
  end
end
