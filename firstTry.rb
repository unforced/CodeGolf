require 'json'
f = open(ARGV[0])
def c(t)
t.downcase.gsub('/[\\(\\)\\.\\/:,;/', '').gsub('?',' ?').gsub('!',' !').gsub('-',' - ')
end
@i = {}
f.each do |l|
i = l.index(':')
@i[l[0..i-1]]=c(l[i+2..-2])
end
def lu(f)
s = []
@i.each_pair do |k,v|
g = true
f.each do |w|
g = false unless v[w]
end
s << k if g
end
s
end
while (true)
print '>'
$stdout.flush
$stdout.write JSON.generate(lu($stdin.gets.split.map {|i| c(i)}))
end
