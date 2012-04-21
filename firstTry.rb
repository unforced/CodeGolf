require 'json'
f = open(ARGV[0])
def c(t)
t.downcase.gsub(/[\\(\\)\\.:,;]/,'').gsub('?',' ?').gsub('!',' !').gsub('-',' - ')
end
@i={}
f.each_line do |line|
i = line.index(':')
@i[line[0..i-2]] = c(line[i+2..-2])
end
def u(m)
s = []
@i.each_pair do |k,v|
g = true
m.each do |w|
g = false unless v[w]
end
s << k if g
end
s
end
while true
print '>'
STDOUT.flush
STDOUT.write JSON.generate(u(STDIN.gets.split.collect {|i| c(i)}))
end

