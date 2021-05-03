require "http"

while true
  system "clear"
  puts "Welcome to the dictionary app!"
  puts "Enter a word:"
  word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  definition = response.parse[0]["text"]
  puts "The definition of #{word} is: #{definition}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=22bf12vddbpizrmyfs90cf695e9j4u1seq52o4klisqmqn6v2")
  top_example = response.parse["text"]
  puts "The top example of #{word} is: #{top_example}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=22bf12vddbpizrmyfs90cf695e9j4u1seq52o4klisqmqn6v2")
  pronunciation = response.parse[0]["raw"]
  puts "The top pronunciation of #{word} is: #{pronunciation}"

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=22bf12vddbpizrmyfs90cf695e9j4u1seq52o4klisqmqn6v2")
  file_url = response.parse[0]["fileUrl"]
  system("open", file_url)

  puts "Enter q to quit or any other key to continue"
  user_input = gets.chomp
  if user_input == "q"
    puts "Thank you, goodbye!"
    break
  end
end

