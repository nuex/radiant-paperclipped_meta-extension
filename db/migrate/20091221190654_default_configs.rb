class DefaultConfigs < ActiveRecord::Migration
  def self.up
    Radiant::Config['assets.meta.keys'] = ''
  end

  def self.down
    Radiant::Config.find_by_key('assets.meta.keys').destroy
  end
end
