require 'spec_helper'

describe Redirect do

  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :short_url }

end
