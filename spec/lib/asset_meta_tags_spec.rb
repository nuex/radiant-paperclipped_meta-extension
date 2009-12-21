require File.dirname(__FILE__) + '/../spec_helper'

describe "Asset Meta" do

  dataset :pages, :assets, :asset_meta

  before do
    @page = pages(:first)
    @asset = assets(:first)
    @asset_meta = asset_meta(:first)
    @asset_meta_empty_value = asset_meta(:empty)
  end

  describe '<r:if_meta>...</r:if_meta>' do

    it 'renders the contained block if the asset has data corresponding with the given key' do
      @page.should render('<r:assets title="asset"><r:if_meta key="test_key">true</r:if_meta></r:assets>').as('true')
    end

    it 'does not render the contained block if the value is empty' do
      @page.should render('<r:assets title="asset"><r:if_meta key="test_key_3">true</r:if_meta></r:assets>').as('')
    end

  end

  describe '<r:meta />' do

    it 'renders the value of the given key' do
      @page.should render('<r:assets title="asset"><r:meta key="test_key" /></r:assets>').as('test_value')
    end

  end

end
