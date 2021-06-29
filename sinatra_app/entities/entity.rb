require 'securerandom'

class Entity
  def self.collection(size)
    size.times.map { Entity.new }
  end

  def self.fetch_data(time)

  end

  def to_h
    {}.tap do |hash|
      25.times do |n|
        hash["property_#{n}"] = rand_value
      end
    end
  end

  def to_json(*args)
    to_h.to_json
  end

  private

  def rand_value
    SecureRandom.hex
  end
end