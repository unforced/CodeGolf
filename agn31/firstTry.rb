require 'json'
f = open(ARGV[0])
def c(t)
t.downcase.gsub(/[\(\)\.;:,\/]/,'').gsub(/[\?!-]/,' ')
end
@i={}
f.each do |l|
i = l.index(':')
@i[l[0..i-2]] = c(l[i+2..-2])
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
while 1
print '>'
STDOUT.flush
STDOUT.write JSON.generate(u(STDIN.gets.split))
end

