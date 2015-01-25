class Game
def initialize(gamematrix)
  @start=gamematrix
  @rows=gamematrix
    puts "rows - #{@rows}"
  @cols=@rows.transpose
end
def findnils
puts "finding the nils"
sleep 0.1

     nilspaces=[]
    g=0
    while g<@cols.length
puts "3  we parse through col #{g}"
sleep 0.1
      p=0
        while p<@rows.length
if @rows[g][p]!=nil
  puts "4 [#{g}][#{p}]"
end
sleep 0.1
          if @rows[g][p]==nil
           puts "      [#{g}][#{p}] :found a nil!!!"
              nilspaces<<[g,p]
          end
        p+=1
        end
      g+=1
    end
    return nilspaces

end

#sleep 0.8
    #update the coordinatebank of nill spaces in the matric
#sleep 0.8
 nilspaces=findnils

  while !win?
  puts '5 now our nilspaces array now looks like this: '
  puts "nils: [#{nilspaces}]"
  sleep 0.4

      #randomly find an empty nil space, find its coordinates in the matrix
    current=nilspaces.sample
  puts "out current nilspace is [#{current}]"
  sleep 0.2
      nilspaces.delete_if{|e| e==current}
  puts "nils: [#{nilspaces}]"
  sleep 0.2
      #then use the guessNum method to guess based on the coordinates
      guessedN=guessNum(@cols[current[0]], @rows[current[1]])
  puts "guessed: #{guessedN}"
  sleep 0.2
      #assign out guessed number to replace the nil
      if guessedN != 999
        @rows[current[0]][current[1]]=guessedN
  sleep 0.1
  puts "guessed rturns a number so @rows is #{@rows[current[0]][current[1]]}"
  puts "          start matrix: #{@start}"

      else
        puts "=========================="
        #reset
          puts "resets everything"
            sleep 0.3
            @rows=@start
            @cols=@rows.transpose
          puts "rows: #{@rows}"
          puts "cols: #{@cols}"
        nilspaces=findnils
        puts "=========================="
        sleep 0.1
      end

      display
    sleep 0.4

  end

end



def guessNum(vset, hset)
                          #create an array of numbers to choose from
choice=(1..@rows.length).to_a
                          #subtract everything in the choice array thats in the hset
choice.delete_if {|e| hset.include?(e)}
                          #subtract everything in the choice array thats in the vset
choice.delete_if {|e| vset.include?(e)}
                          #if nothing is left in the choice array return a string called empty
                          #otherwise return a random number from the array (the choice array)
    if choice.empty?
      return 999
    else
      return choice.sample
    end

end

def display
  puts "--------------------"
  for g in @rows
    out="        "
    for l in g
      out+= "#{'%03s' % l.to_s}"
    end
    out+=" \n"
    puts out
  end
  puts "--------------------"
end


def win?
[@rows.all? { |e| e.uniq.length==@rows.length }, @cols.all? { |e| e.uniq.length==@cols.length }].all? { |e| e==true  }
end

end

easygame4x4=[[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]]

gameone=Game.new(easygame4x4)

gameone.sudku