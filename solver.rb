#!/usr/bin/env ruby

def depth(city, r, c)
  while r < city.length && city[r][c].eql?('P')
    r += 1
  end
  return r
end

def length(city, r, c)
  while c < city[r].length && city[r][c].eql?('P')
    c += 1
  end
  return c
end

def grow_point(city, r, c)
  area = 0
  for i in c...length(city, r, c) # exclusive range
    l = i+1 - c
    d = depth(city, r, i) - r
    if l*d > area
      area = l*d
    end
  end
  return area
end



def analyze(city)
  #analysis = Array.new
  farea = 0
  city.each_with_index do |row, r|
    #arow = Array.new
    row.each_with_index do |col, c|
      if col.eql?('P')
        area = grow_point city, r, c
        #arow[c] = area
        if area > farea
          farea = area
          fr = r
          fc = c
        end
      end
    #analysis[r] = arow
    end
  end
  #return analysis
  return farea, fr, fc
end

def load_city
  city = Array.new
  f = File.open("city_grid.txt", "r") #opens the file for reading
  f.each do |line| 
    city.push(line.squeeze.split)
  end
  return city
end

puts "Loading city"
city = load_city
puts analyze city
