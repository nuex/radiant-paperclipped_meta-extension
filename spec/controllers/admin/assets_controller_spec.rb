require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::AssetsController do
  dataset :users, :assets, :asset_meta

  before do
    login_as :developer
    @asset = assets(:first)
    Asset.stub!(:find).and_return(@asset)
  end

  it 'POST: creates metadata from its metadata child attributes' do
    post :create, :asset => @asset.attributes.merge({ :meta_attributes => [ { :key => 'test_key', :value => 'test_value' } ] })
  end

  it 'PUT: updates metadata' do
    put :update, :id => @asset.id, :asset => { :meta_attributes => [ { :key => 'test_key', :value => 'test_value_2' } ] }
  end

end
