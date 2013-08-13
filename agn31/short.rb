z=open($*.shift).map{|l|i=l.split ' : ',2;[i[0],i[1].downcase.gsub(/[\(\)\.;:,\/]/,'').gsub(/[\?!-]/,' ')]}
loop{puts '>';$>.flush;m=gets.split;p z.select{|_,v|m.all?{|w|v[w]}}.map &:first}
