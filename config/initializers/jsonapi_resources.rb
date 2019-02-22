JSONAPI.configure do |config|
  # built in paginators are :none, :offset, :paged
  config.default_paginator = :paged
  config.default_page_size = 1000_000
  config.maximum_page_size = 10_000_000
end
