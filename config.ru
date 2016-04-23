require "json"
require "net/http"

app = lambda do |_env|
  uri = URI("https://api.appear.in/random-room-name")
  response = Net::HTTP.get(uri)
  json = JSON.parse(response)
  [307, { "Location" => "https://appear.in#{json["roomName"]}" }, []]
end

run app
