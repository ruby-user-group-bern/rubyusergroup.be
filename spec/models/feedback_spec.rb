require 'spec_helper'

describe Feedback do

  describe "associations: " do
    it { should belong_to(:author) }
  end

  describe "validations: " do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:author) }
  end
end
