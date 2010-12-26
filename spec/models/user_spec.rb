require 'spec_helper'

describe User do

  it_should_behave_like 'factory creatable'

  describe "associations: " do
    it { should have_many(:questions) }
    it { should have_many(:topics) }
  end

end
