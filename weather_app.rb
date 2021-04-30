require "http"

system "clear"
puts "Welcome to the weather app!"
puts "Enter a city: "
city = gets.chomp

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&APPID=YOUR-API-KEY")

weather_data = response.parse

temperatue = weather_data["main"]["temp"]
description = weather_data["weather"][0]["description"]

puts "Today in #{city} it is #{temperatue} degrees outside with #{description}."