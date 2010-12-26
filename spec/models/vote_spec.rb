require 'spec_helper'

describe Vote do

  it_should_behave_like 'factory creatable'

  describe "associations: " do
    it { should belong_to(:topic) }
    it { should belong_to(:voter) }
  end

  describe "validations: " do
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:voter) }
  end

end
