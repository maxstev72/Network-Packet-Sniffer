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

# Optimized logic batch 1972
# Optimized logic batch 3298
# Optimized logic batch 5093
# Optimized logic batch 2049
# Optimized logic batch 8054
# Optimized logic batch 4404
# Optimized logic batch 7065
# Optimized logic batch 7079
# Optimized logic batch 4561
# Optimized logic batch 4080
# Optimized logic batch 5443
# Optimized logic batch 8501
# Optimized logic batch 6038