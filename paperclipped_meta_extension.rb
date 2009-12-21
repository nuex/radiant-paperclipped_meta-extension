# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class PaperclippedMetaExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/paperclipped_meta"

  define_routes do |map|
    map.resources :meta, :path_prefix => '/admin/assets/:asset_id', :controller => 'admin/asset_meta'
  end

  def activate
    Asset.send :include, AssetMetaAssetExtensions
    Page.send :include, AssetMetaTags
    unless admin.asset.edit.form.edit_metadata.include?('admin/assets/meta_fields')
      admin.assets.edit.form.edit_metadata.add :meta_fields, 'admin/assets/meta_fields'
    end
  end

  def deactivate
  end

end
