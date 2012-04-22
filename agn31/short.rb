require 'json';@i={};open($*.shift).each{|l|;i=l.split(' : ',2);@i[i[0]]=i[1].downcase.gsub(/[\(\)\.;:,\/]/,'').gsub /[\?!-]/,' '};def u m;s=[];@i.each{|k,v|g=1;m.each{|w|;g=nil if !v[w]};s<<k if g};s;end;while 1;puts '>';$>.flush;puts JSON.dump u gets.split;end

