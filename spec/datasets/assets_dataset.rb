# Because paperclipped doesn't have an Assets dataset.
class AssetsDataset < Dataset::Base
  def load
    create_record :asset, :first,
      { :title => 'asset', :asset_file_name => 'asset.jpg', :asset_content_type => 'image/jpeg', :asset_file_size => '46248' }
  end
end
