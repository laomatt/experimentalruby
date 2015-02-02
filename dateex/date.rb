require 'date'

today=Date.parse('23rd Feb 2015')

#p today

#method .strftime formats the day is such a way:
#http://ruby-doc.org/stdlib-2.2.0/libdoc/date/rdoc/Date.html#method-i-strftime

#p "today:    #{today.strftime('%a %d %b %Y')}"

tomarrow=today+7*9
yesterday=today-7*9

#p "tomarrow: #{tomarrow.strftime('%a %d %b %Y')}"
#p "today:    #{today.strftime('%a %d %b %Y')}"

sampledate=Date.parse('23rd Jan 2015')
sampledate2=Date.parse('23rd Aug 2015')

range=[]

i=0
while i<7*9
  range<<yesterday+i
  i+=1
end

#p range

#p range.include?(sampledate2)

#p Date.parse('2015-01-02')

p Date.today<=tomarrow