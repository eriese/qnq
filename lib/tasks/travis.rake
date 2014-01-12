require 'coveralls/rake/task'
Coveralls::RakeTask.new

namespace :travis do

  desc "Prepare DB and run Tests"
  task :run do
    ["rake db:create", "rake db:migrate RAILS_ENV=test", "rake db:seed RAILS_ENV=test", "rspec spec", "rake coveralls:push"].each do |cmd|
      puts "Starting to run #{cmd}..."
      system("bundle exec #{cmd}")
      raise "#{cmd} failed!" unless $?.exitstatus == 0
    end
  end

end
