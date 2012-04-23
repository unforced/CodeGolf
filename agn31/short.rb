require 'json'
@i={};open($*.shift).each{|l|;i=l.split(' : ',2);@i[i[0]]=i[1].downcase.gsub(/[\(\)\.;:,\/]/,'').gsub /[\?!-]/,' '}
loop{puts '>';$>.flush;m=gets.split;puts JSON.dump @i.collect{|k,v|g=1;m.each{|w|g=!1 if !v[w]};k if g}.compact}
