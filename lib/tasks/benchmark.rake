require 'fileutils'

benchmark_dir = "benchmarks/#{Date.today.to_s}"
benchmark_tests = [[100,10],[500,10],[500,50]]
APP_ROOT_URL = "http://0.0.0.0:3000/"

namespace "benchmark" do
  desc "Run ApacheBench benchmarks"
  task :apache do
    puts 'Running benchmarks...'
    benchmark_tests.each do |test|
      requests, threads = test[0], test[1]
      FileUtils.mkdir_p benchmark_dir # creates directory if it does not exist
      benchmark_file = "bm_#{requests}_#{threads}.txt"
      full_dir = "#{benchmark_dir}/#{benchmark_file}"
      puts "Saving results into #{full_dir}"
      File.open(full_dir,"w") do |file| # creates file
        puts "Running #{requests} requests with #{threads} threads"
        file.puts sh "ab -n #{requests} -c #{threads} #{APP_ROOT_URL}"
        puts "Results saved into #{full_dir}"
      end
    end
    puts 'All benchmarks OK, exiting...'
  end
end
