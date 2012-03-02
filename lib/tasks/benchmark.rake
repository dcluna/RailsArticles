require 'fileutils'

BENCHMARK_DIR = "benchmarks/#{Date.today.to_s}"
BENCHMARK_TESTS = {
  :get => [[100,10],[500,10],[500,50]],
  :post => [[500,1],[500,5],[500,50]],
  :update => [[500,1],[500,5],[500,50]]
}

APP_ROOT_URL = "http://0.0.0.0:3000/"

def run_test(test_type,result_name,&command)
  BENCHMARK_TESTS[test_type].each do |test|
    requests, threads = test[0], test[1]
    full_dir = "#{BENCHMARK_DIR}/#{result_name}_#{requests}_#{threads}.txt"
    FileUtils.mkdir_p BENCHMARK_DIR
    File.open(full_dir,"w") do |file|
      if block_given?
        command_str = command.call(requests,threads,full_dir)
        sh command_str
      end
    end
  end
end

namespace "benchmark" do
  desc "Run GET benchmarks"
  task :get do
    run_test(:get,"get_bm") do |requests,threads,filename| "ab -n #{requests} -c #{threads} #{APP_ROOT_URL} > #{filename}" end
  end

  desc "Run Post creation benchmarks"
  task :create do
    run_test(:post,"create_post") { |requests,threads,filename| "ab -n #{requests} -c #{threads} -p benchmarks/random_post.txt -T 'application/x-www-form-urlencoded' #{APP_ROOT_URL}posts > #{filename}" }
  end

  desc "Run Post update benchmarks"
  task :update, :post_id do |task,args|
    post_id = args[:post_id]
    if post_id.nil?
      puts "Usage: rake benchmark:update[<post_id>]"
    else
      run_test(:update,"update_post_#{post_id}") {|requests,threads,filename| "ab -n #{requests} -c #{threads} -u benchmarks/random_post.txt -T 'application/x-www-form-urlencoded' #{APP_ROOT_URL}posts/#{post_id} > #{filename}"}
    end
  end
end
