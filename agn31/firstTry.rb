require 'json'
f=open ARGV[0]
def c t;t.downcase.gsub(/[\(\)\.;:,\/]/,'').gsub /[\?!-]/,' ';end
@i={}
f.each{|l|;i=l.index ':';@i[l[0..i-2]] = c l[i+2..-2]}
def u m;s=[];@i.each{|k,v|g=1;m.each{|w|;g = nil unless v[w]};s<<k if g};s;end
while 1;print '>';STDOUT.flush;STDOUT.write JSON.dump u STDIN.gets.split;end

