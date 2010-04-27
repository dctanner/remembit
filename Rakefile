desc "Load env"
task :environment do
  require 'remembit'
end

namespace :db do
  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
  
  desc "Load bootstrap data"
  task(:bootstrap => :environment) do
    require 'db/bootstrap'
  end
end