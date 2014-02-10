require 'spec_helper'

describe NullRedirect do

  it "returns the root path as the redirect's url" do
    expect(NullRedirect.new.url).to eq('/')
  end

end
