module AssetMetaAssetExtensions

  def self.included kls
    kls.send :has_many, :meta, :class_name => 'AssetMetum'
    kls.send :validates_associated, :meta
    kls.send :accepts_nested_attributes_for, :meta
  end

end
