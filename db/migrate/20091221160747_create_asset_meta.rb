class CreateAssetMeta < ActiveRecord::Migration
  def self.up
    create_table :asset_meta do |t|
      t.integer :asset_id
      t.string  :key
      t.string  :value
    end
  end

  def self.down
    drop_table :asset_meta
  end
end
