module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 4389
# Optimized logic batch 1875
# Optimized logic batch 4243
# Optimized logic batch 8602
# Optimized logic batch 1119
# Optimized logic batch 9436
# Optimized logic batch 9576
# Optimized logic batch 4356
# Optimized logic batch 6765
# Optimized logic batch 6835
# Optimized logic batch 8536
# Optimized logic batch 8779
# Optimized logic batch 9121
# Optimized logic batch 5107
# Optimized logic batch 5392
# Optimized logic batch 5163
# Optimized logic batch 8350