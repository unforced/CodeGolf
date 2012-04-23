require 'json'
@i={};open($*.shift).each_line{|l|;s=l.split(' : ',2);s[1].downcase.gsub(/[\(\)\.;:,\/]/,'').gsub(/[\?!-]/,' ').split.each{|w|;@i[w]||=[];@i[w]<<s[0]}}
@j={};@i.each{|k,v|;v.uniq!;n=[];(k.length-2).times{|i|;(i+2).upto(k.length-1){|j|;n<<k[i..j]}};n.uniq.each{|s|;@j[s]||=[];@j[s]<<k if !@j[s].include?k}}
def u(s);l=[];s.each{|w|;x=[];if @j[w];@j[w].each{|k|x.concat(@i[k])};end;l<<x};m=nil;l.each{|q|;m||=q;m=m&q};m;end
while 1;puts '>';$>.flush;puts(JSON.dump(u(gets.split)));end
