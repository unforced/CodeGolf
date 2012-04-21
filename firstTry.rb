require 'json'
f = open(ARGV[0])
def clean(text)
	text.downcase.gsub('/','').gsub('(','').gsub(')','').gsub(':','').gsub('.','').gsub(',','').gsub(';','').gsub('?',' ?').gsub('!', ' !').gsub('-',' - ')
end

input_lines = []
f.each_line do |line|
	input_lines << line
end
@index = {}
input_lines.each do |line|
	i = line.index(':')
	@index[line[0..i-2]] = clean(line[i+2..-2])
end

def lookup(words)
	successful = []
	@index.each_pair do |key,value|
		good_pair = true
		words.each do |word|
			good_pair = false unless value[word]
		end
		successful << key if good_pair
	end
	successful
end

while (true)
	print '>'
	$stdout.flush
	$stdout.write JSON.generate(lookup($stdin.gets.split.collect {|i| clean(i)}))
end

