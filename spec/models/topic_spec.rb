require 'spec_helper'

describe Topic do

  it_should_behave_like 'factory creatable'

  describe "associations: " do
    it { should belong_to(:submitter) }
  end

  describe "validations: " do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:submitter) }
  end

end
