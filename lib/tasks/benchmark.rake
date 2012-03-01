require 'fileutils'

BENCHMARK_DIR = "benchmarks/#{Date.today.to_s}"
BENCHMARK_TESTS = {
  :get => [[100,10],[500,10],[500,50]],
  :post => [[50,1],[50,5],[50,20]]
}

APP_ROOT_URL = "http://0.0.0.0:3000/"

def run_test(test_type,result_name,&command)
  puts 'Running benchmarks...'
  BENCHMARK_TESTS[test_type].each do |test|
    requests, threads = test[0], test[1]
    FileUtils.mkdir_p BENCHMARK_DIR # creates directory if it does not exist
    full_dir = "#{BENCHMARK_DIR}/#{result_name}_#{requests}_#{threads}.txt"
    puts "Saving results into #{full_dir}"
    File.open(full_dir,"w") do |file| # creates file
      if block_given?
        puts "Running #{requests} requests with #{threads} threads"
        command_str = command.call(requests,threads)
        file.puts sh command_str
        puts "Results saved into #{full_dir}"
      end
    end
  end
  puts 'Ending test...'
end

namespace "benchmark" do
  desc "Run GET benchmarks"
  task :get do
    run_test(:get,"get_bm") do |requests,threads| "ab -n #{requests} -c #{threads} #{APP_ROOT_URL}" end
  end

  desc "Run Post creation benchmarks"
  task :create do
    run_test(:post,"create_post") { |requests,threads| "ab -n #{requests} -c #{threads} -p benchmarks/random_post.txt -T 'application/x-www-form-urlencoded' #{APP_ROOT_URL}posts" }
  end
end
