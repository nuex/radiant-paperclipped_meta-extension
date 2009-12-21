require File.dirname(__FILE__) + '/../spec_helper'

describe AssetMetum do
  dataset :assets, :asset_meta

  describe "validations" do

    it "should be valid" do
      create_asset_metum
      @asset_metum.should be_valid
    end

    [:key, :asset_id].each do |att|
      it "requires #{att} attribute" do
        lambda do
          create_asset_metum(att => nil)
          @asset_metum.errors.on(att).should_not be_nil
        end.should_not change(AssetMetum, :count)
      end
    end

    it "requires 'key' attribute to be unique within 'asset_id' scope" do
      lambda do
        create_asset_metum(:key => 'test_key', :asset_id => assets(:first).id)
        @asset_metum.errors.on(:key).should_not be_nil
      end.should_not change(AssetMetum, :count)
    end
  end

  describe "methods" do
    it 'shows metadata that can be assigned to the asset' do
      Radiant::Config['paperclipped.asset_meta.keys'] = 'test_key, test_key_2'
    end
  end

  private

  def create_asset_metum(options = {})
    @asset_metum = AssetMetum.new({:key => "test_key", :value => "test_value", :asset_id => '1'}.merge(options))
    @asset_metum.save
    @asset_metum
  end

end
