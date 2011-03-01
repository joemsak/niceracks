require 'spec_helper'

describe Lady do

  def reset_lady(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @lady.destroy! if @lady
    @lady = Lady.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_lady
  end

  context "validations" do
    
    it "rejects empty name" do
      Lady.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_lady
      Lady.new(@valid_attributes).should_not be_valid
    end
    
  end

end