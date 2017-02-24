require 'em-websocket'
require 'faker'
require 'json'

@current_names = []
@users={}
@channel = EM::Channel.new

def add_name(sid, name)
  ret = false
  if !@current_names.include?(name)
    @current_names.push(name)
    @users[sid] = name
    ret = true
  end
  return ret
end

EM.run {
  EM::WebSocket.run(:host => "0.0.0.0", :port => 8080) do |ws|
    puts ws
    ws.onopen { |handshake|
      puts "WebSocket connection open"
      puts "origin: #{handshake.origin}"
      puts "headers: #{handshake.headers}"

      def broadcast_message(message)
        ret = {}
        ret["cmd"] = "message"
        ret["message"] = message
        @channel.push JSON.generate(ret)
      end

      sid = @channel.subscribe { |msg| ws.send msg }
      # ws.send "Hello Client, you connected to #{handshake.path}"
      # Broadcast that ws just joined
      ret = {}
      ret["cmd"] = "join"
      ret["success"] = true
      ret["username"] = "Anonymous##{sid}"
      ws.send JSON.generate(ret)

      broadcast_message("Anonymous##{sid} joins the chatroom.")
      # @channel.push "#{sid} connected!"

      ws.onerror do |error|
        puts "[error] #{error}"
      end

      ws.onclose {
        broadcast_message("Anonymous##{sid} leaves the chatroom.")
        # @channel.push "#{sid} disconnected!"
        @channel.unsubscribe(sid)
        name = @users[sid]
        @current_names.delete(name)
        @users[sid] = nil
        if name
          puts "#{name} quits the chatroom."
        end
        puts "Connection closed"
      }

      ws.onmessage { |msg|
        puts "message from client: #{msg}"
        json_msg = JSON.parse(msg)

        case json_msg['cmd']
        when 'chat'
          broadcast_message("Anonymous##{sid}: #{json_msg['message']}")
        end
      }
    }
  end
}
