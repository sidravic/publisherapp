class Message
	def self.publish_post(message, user_id)
		puts "Message has arrived #{message} #{AMQP.channel}"		
		
		EventMachine.next_tick do			
			exchange = AMQP.channel.fanout("rabbots.exchange")	
			queue = AMQP.channel.queue("rabbots.posts", :durable => true)
			exchange.publish(message, :queue => queue.name)
		end		
	end
end