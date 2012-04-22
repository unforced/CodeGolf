#Reverse Index
require 'json'
file = open(ARGV[0])
clock = Time.now
@index = {}
file.each_line do |line|
	splitSpot = line.index(':')
	key = line[0..splitSpot-2]
	value = line[splitSpot+2..-1]
	value.downcase.gsub(/[\(\)\.;:,\/]/,'').gsub(/[\?!-]/,' ').split.each do |word|
		@index[word] ||= []
		@index[word] << key
	end
end
@index.each_key do |key|
	@index[key].uniq!
end
@index2 = {}
@index.each_key do |key|
	ngrams = []
	(key.length-2).times do |i|
		(i+2).upto(key.length-1) do |j|
			ngrams << key[i..j]
		end
	end
	ngrams.uniq.each do |sub|
		@index2[sub] ||= []
		@index2[sub] << key if !@index2[sub].include?key
	end
end
puts Time.now-clock
def intersection(x)
	m=nil
	x.each do |q|
		m||=q
		m=m&q
	end
	m
end
def lookup(words)
	valuelist = []
	words.each do |word|
		word_values = []
		if @index2[word]
			@index2[word].each do |key|
				word_values.concat(@index[key])
			end
		end
		valuelist << word_values
	end
	intersection(valuelist)
end

while true
	print '>'
	STDOUT.flush
	STDOUT.write(JSON.dump(lookup(STDIN.gets.split)))
end