require "csv"

namespace :products do
  desc "sync products from csv"
  task csv_sync: :environment do
    ProductCsvLoaderService.new.call
  end
end
