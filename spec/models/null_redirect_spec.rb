require 'spec_helper'

describe NullRedirect do

  it "returns the application's root for url_with_protocol" do
    expect(NullRedirect.new.url_with_protocol).to eq('/')
  end

end
