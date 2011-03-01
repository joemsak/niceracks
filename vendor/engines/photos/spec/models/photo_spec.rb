require 'spec_helper'

describe Photo do

  def reset_photo(options = {})
    @valid_attributes = {
      :id => 1,
      :caption => "RSpec is great for testing too"
    }

    @photo.destroy! if @photo
    @photo = Photo.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_photo
  end

  context "validations" do
    
    it "rejects empty caption" do
      Photo.new(@valid_attributes.merge(:caption => "")).should_not be_valid
    end

    it "rejects non unique caption" do
      # as one gets created before each spec by reset_photo
      Photo.new(@valid_attributes).should_not be_valid
    end
    
  end

end