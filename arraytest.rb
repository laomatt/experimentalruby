class Dude

def initialize(p)

  @start=p
  @row=p
end

def action
  for i in (0..4)
    puts "#{@row+i}   ---   #{@start}"
  end

end

end

matt=Dude.new(9)

matt.action