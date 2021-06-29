require 'benchmark'
require 'uri'
require 'net/http'


uri = URI('http://test.k6.io')
request = -> { Net::HTTP.get_response(uri) }

Benchmark.bm(7) do |x|
  x.report('threads') do
    threads = []
    10.times do
        threads << Thread.new { request.call }
    end
    threads.map(&:join)
  end

  x.report('sync') do
    10.times do
        request.call
    end
  end
end