class AssetMetaDataset < Dataset::Base

  uses :assets

  def load
    create_record :asset_metum, :first,
      { :key => 'test_key', :value => 'test_value', :asset_id => assets(:first).id }

    create_record :asset_metum, :second,
      { :key => 'test_key_2', :value => 'test_value', :asset_id => assets(:first).id }

    create_record :asset_metum, :empty,
      { :key => 'test_key_3', :value => '', :asset_id => assets(:first).id }
  end

end
