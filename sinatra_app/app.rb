require 'sinatra'
require 'json'
require_relative 'entities/entity'

calculation = -> { 50_000.times { 1.0/3 } }
async = defined?(Async)
blocking_operation = ->(time=0.015) { async ? Async { |task| task.sleep(time) }.wait : sleep(time) }

get '/' do
  content_type :json
  blocking_operation.call
  calculation.call
  Entity.collection(100).to_json
end
