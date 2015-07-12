require 'open-uri'
html = open('https://www.google.com/search?q=%E3%81%94%E3%83%BC%E3%82%8B+%E3%82%AF%E3%83%83%E3%82%AD%E3%83%BC&safe=off&tbm=isch').read

puts html
