module AssetMetaTags

  include Radiant::Taggable

  class TagError < StandardError; end

  desc %{
    Renders the contained block if the asset has data for the given key. Requires
    a 'key' attribute.

    *Usage:*
    <pre><code><r:if_meta [key="url"]>...</r:if_meta></code></pre>
  }
  tag 'assets:if_meta' do |tag|
    asset = tag.locals.asset
    key = tag.attr['key']
    raise TagError, 'key attribute required' unless key
    meta = asset.meta.find_by_key(key)
    if meta and !meta.value.blank?
      tag.expand
    end
  end

  desc %{
    Renders the contained block unless the asset has data for the given key. Requires
    a 'key' attribute.

    *Usage:*
    <pre><code><r:unless_meta [key="url"]>...</r:unless_meta></code></pre>
  }
  tag 'assets:unless_meta' do |tag|
    asset = tag.locals.asset
    key = tag.attr['key']
    raise TagError, 'key attribute required' unless key
    meta = asset.meta.find_by_key(key)
    unless meta and !meta.value.blank?
      tag.expand
    end
  end

  desc %{
    Renders the asset's metadata value of the given key. Requires a 'key' attribute.

    *Usage:*
    <pre><code><r:meta [key="url"]>...</r:meta></code></pre>
  }
  tag 'assets:meta' do |tag|
    asset = tag.locals.asset
    key = tag.attr['key']
    raise TagError, 'key attribute required' unless key
    metum = asset.meta.find_by_key(key)
    raise TagError, 'no metadata found with that key for this asset' unless metum
    return metum.value
  end

end
