#Reverse Index
require 'json'
def clean(text)
	text.downcase.gsub(/[\(\)\.;:,\/]/,'').gsub(/[\?!-]/,' ')
end
file = open(ARGV[0])
clock = Time.now
@index = {}
file.each_line do |line|
	splitSpot = line.index(':')
	key = line[0..splitSpot-2]
	value = line[splitSpot+2..-1]
	value = clean(value)
	value.split.each do |word|
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
	key.length.times do |i|
		i.upto(key.length-1) do |j|
			ngrams << key[i..j]
		end
	end
	ngrams.uniq.each do |sub|
		@index2[sub] ||= []
		@index2[sub] << key if !@index2[sub].include?key
	end
end
puts Time.now-clock
def lookup(words)
	values = []
	words.each do |word|
		if @index2[word]
			@index2[word].each do |key|
				values.concat(@index[key])
			end
		end
	end
	values.uniq
end
while true
	print '>'
	STDOUT.flush
	STDOUT.write(JSON.dump(lookup(STDIN.gets.split)))
end
