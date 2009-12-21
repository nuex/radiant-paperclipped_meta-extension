class AssetMetum < ActiveRecord::Base

  belongs_to :asset

  validates_presence_of   :key
  validates_presence_of   :asset_id

  validates_uniqueness_of :key, :scope => :asset_id

  def self.assignable_meta(asset=nil)
    keys = Radiant::Config['assets.meta.keys'].split(', ')
    if asset
      return keys.collect{|k| asset.meta.find_or_create_by_key(k)}
    else
      return keys.collect{|k| OpenStruct.new({:key => k, :value => ''})}
    end
  end

end
