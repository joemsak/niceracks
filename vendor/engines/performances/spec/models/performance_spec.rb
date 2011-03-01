require 'spec_helper'

describe Performance do

  def reset_performance(options = {})
    @valid_attributes = {
      :id => 1,
      :venue_name => "RSpec is great for testing too"
    }

    @performance.destroy! if @performance
    @performance = Performance.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_performance
  end

  context "validations" do
    
    it "rejects empty venue_name" do
      Performance.new(@valid_attributes.merge(:venue_name => "")).should_not be_valid
    end

    it "rejects non unique venue_name" do
      # as one gets created before each spec by reset_performance
      Performance.new(@valid_attributes).should_not be_valid
    end
    
  end

end