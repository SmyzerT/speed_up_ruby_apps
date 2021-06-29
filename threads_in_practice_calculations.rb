require 'benchmark'

calculation = ->(count) { count.times { 1.0/3 } }

Benchmark.bm(7) do |x|
  x.report('threads') do
    threads = []
    1000.times do
        threads << Thread.new { calculation.call(1000) }
    end
    threads.map(&:join)
  end

  x.report('sync') do
    calculation.call(1_000_000)
  end
end