shared_examples_for "factory creatable" do

  it "should have a valid factory" do
    factory_name = subject.class.name.underscore
    Factory.build(factory_name).should be_valid
  end

end
