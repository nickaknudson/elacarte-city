#!/usr/bin/env ruby

def load_city
  city = Array.new
  f = File.open("city_grid.txt", "r") #opens the file for reading
  f.each do |line| 
    puts line
  end
  return city
end


puts "Loading city"
city = load_city