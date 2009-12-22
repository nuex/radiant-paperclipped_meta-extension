# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class PaperclippedMetaExtension < Radiant::Extension
  version "1.0"
  description "Adds metadata to paperclipped assets."
  url "http://github.com/nuex/radiant-paperclipped_meta-extension"

  define_routes do |map|
    map.resources :meta, :path_prefix => '/admin/assets/:asset_id', :controller => 'admin/asset_meta'
  end

  def activate
    Asset.send :include, AssetMetaAssetExtensions
    Page.send :include, AssetMetaTags

    admin.asset.edit.add :extended_metadata, '/admin/assets/meta_fields', :after => 'edit_metadata'
  end

  def deactivate
  end

end
