class AssetMetum < ActiveRecord::Base

  belongs_to :asset

  validates_presence_of   :key
  validates_uniqueness_of :key, :scope => :asset_id

  def self.assignable_meta(asset)
    keys = Radiant::Config['assets.meta.keys'].split(', ')
    return keys.collect do |k|
      if meta = asset.meta.find_by_key(k)
        meta
      else
        asset.meta.build(:key => k)
      end
    end
  end

end
