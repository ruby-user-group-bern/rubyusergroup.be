require 'spec_helper'

describe Answer do

  it_should_behave_like 'factory creatable'

  describe "associations: " do
    it { should belong_to(:question) }
    it { should belong_to(:author) }
  end

  describe "validations: " do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:content) }
  end

end
