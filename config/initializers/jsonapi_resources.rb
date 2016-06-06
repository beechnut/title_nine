JSONAPI.configure do |config|
  config.default_paginator = :paged

  config.default_page_size = 25
  config.maximum_page_size = 100

  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :total
end