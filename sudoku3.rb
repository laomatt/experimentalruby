

#########refactored sudoku ###############

    class Game
    def initialize(gamematrix)
      #@start=gamematrix.clone
      @rows=gamematrix.clone
      @start=gamematrix
     #   puts "rows - #{@rows}"
      @cols=@rows.transpose
    end

    def findnils
    puts "finding the nils"
    sleep 0.1
    nilspaces=[]
        for g in (0..@cols.length-1)
            for p in (0..@rows.length-1)
              if @rows[g][p] != nil
                puts "[#{g}][#{p}]"
              else
                puts "      [#{g}][#{p}] :found a nil!!!"
                  nilspaces<<[g,p]
              end
            end
        end
        return nilspaces
    end

    def original
      for g in (1..4)
        puts "rows  #{@rows.map { |e| e.map { |f|  g } }}"
        puts "start #{@start}"
      end
      return @start
    end

#########      main game method     #############
#########      main game method     #############

    def sudku
    puts  "we\'re in the sudku method our start matrix is #{@start}"
    sleep 0.8
     nilspaces=findnils

      while !win?
              puts '5 now our nilspaces array now looks like this: '
              puts "nils: [#{nilspaces}]"
              sleep 0.4
          current=nilspaces.sample     #randomly find an empty nil space, find its coordinates in the matrix
                puts "out current nilspace coordinate is  [#{current}]"
                sleep 0.2
          nilspaces.delete_if{|e| e==current}
                puts "after deleting the picked nilspace: [#{nilspaces}]"
                sleep 0.2
          #then use the guessNum method to guess based on the coordinates
          guessedN=guessNum(@cols[current[0]], @rows[current[1]])
                puts "guessed: #{guessedN}"
                sleep 0.2
          #assign out guessed number to replace the nil
          if guessedN != 999
            @rows[current[0]][current[1]]=guessedN
            #@start[current[0]][current[1]]=nil
                sleep 0.1
                puts "guessed returns a number(#{guessedN}) so @rows is #{@rows[current[0]][current[1]]}"
                puts ''
                puts "start matrix - #{@start}"
                puts "row matrix   - #{@rows}"
                puts "                                =====> =====> =====>     start matrix: #{@start==@rows}    <===== <===== <====="
                puts ''

          else
            puts "returned 999 so now we must reset"
            puts "=========================="
            sleep 1.0
            #reset
              puts "resets everything"
                sleep 0.8
                @rows=@start
                @cols=@rows.transpose
              puts "rows: #{@rows}"
              puts "cols: #{@cols}"
            nilspaces=findnils
            puts "=========================="
            puts "now we repeat"
            sleep 2.0
          end

          display
        sleep 0.4

      end

    end



    def guessNum(vset, hset)
                              #create an array of numbers to choose from
    choice=(1..@rows.length).to_a
                              #subtract everything in the choice array thats in the hset and vset
    choice.delete_if {|e| (hset.include?(e) || vset.include?(e))}
                              #subtract everything in the choice array thats in the vset
    #choice.delete_if {|e| vset.include?(e)}
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









easygame3x3=[[1,nil,nil],[2,3,nil],[nil,nil,2]]
easygame4x4=[[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]]
mediumgame6x6=[[nil,nil,nil,1,5,nil],[4,nil,3,nil,nil,nil],[nil,nil,nil,nil,nil,nil],[nil,3,nil,5,nil,2],[nil,nil,nil,nil,2,nil],[nil,nil,nil,nil,1,nil]]
hardfuckingame9x9=[[nil,nil,2,nil,3,nil,nil,nil,nil],[5,nil,nil,9,nil,nil,nil,2,7],[4,nil,6,nil,nil,2,5,nil,nil],[nil,4,nil,nil,nil,nil,9,nil,nil],[9,nil,nil,4,8,7,nil,nil,3],[nil,nil,5,nil,nil,nil,nil,7,nil],[nil,nil,4,2,nil,nil,3,nil,8],[8,3,nil,nil,nil,4,nil,nil,2],[nil,nil,nil,nil,6,nil,7,nil,nil]]

gameone=Game.new(easygame4x4)

gameone.sudku
#gameone.original


#puts sudoku([[1,nil,nil],[2,3,nil],[nil,nil,2]])
#puts sudoku([[4,nil,nil,nil],[nil,3,4,nil],[nil,1,2,nil],[nil,nil,nil,1]])

#puts sudoku([[nil,nil,nil,nil,3],[nil,2,nil,nil,nil],[nil,nil,nil,nil,5],[nil,nil,2,1,nil],[1,nil,nil,nil,nil]])



#########    hard problems   ############
#puts sudoku([[nil,nil,nil,1,5,nil],[4,nil,3,nil,nil,nil],[nil,nil,nil,nil,nil],[nil,3,nil,5,nil,2],[nil,nil,nil,nil,2,nil],[nil,nil,nil,nil,1,nil]])
#puts sudoku([[nil,nil,3,nil,5,nil,8,nil,nil],[nil,8,nil,nil,nil,nil,nil,2,nil],[5,nil,nil,nil,nil,1,nil,nil,6],[nil,nil,1,9,nil,4,nil,nil,nil],[7,nil,nil,nil,nil,nil,nil,nil,1],[nil,nil,nil,6,nil,8,9,nil,nil],[6,nil,nil,2,nil,nil,nil,nil,9],[nil,2,nil,nil,nil,nil,nil,7,nil],[nil,nil,9,nil,6,nil,3,nil,nil]])
#puts sudoku([[nil,nil,nil,nil,nil],[nil,4,nil,nil,nil],[nil,nil,nil,5,nil],[1,nil,nil,nil,nil],[nil,nil,5,nil,2]])
#puts sudoku([[nil,2,nil,4,nil],[nil,nil,3,nil,nil],[nil,1,nil,2,nil],[nil,4,nil,nil,nil],[nil,nil,nil,nil,4]])
#puts sudoku([[5,nil,nil,nil,nil],[nil,nil,nil,5,nil],[nil,4,nil,nil,nil],[nil,nil,1,nil,nil],[nil,nil,nil,3,nil]])
#puts sudoku([[nil,nil,4,6,nil,nil],[nil,3,nil,nil,nil,nil],[3,4,nil,2,nil,nil],[5,nil,2,nil,6,nil],[2,5,nil,nil,3,nil],[nil,nil,nil,nil,nil,1]])
##puts sudoku([[nil,5,nil,nil,nil,2],[nil,nil,nil,nil,nil,4],[nil,nil,4,1,nil,nil],[1,nil,3,2,nil,nil],[2,nil,nil,nil,6,nil],[nil,4,1,5,2,nil]])
#puts sudoku([[nil,nil,2,nil,3,nil,nil,nil,nil],[5,nil,nil,9,nil,nil,nil,2,7],[4,nil,6,nil,nil,2,5,nil,nil],[nil,4,nil,nil,nil,nil,9,nil,nil],[9,nil,nil,4,8,7,nil,nil,3],[nil,nil,5,nil,nil,nil,nil,7,nil],[nil,nil,4,2,nil,nil,3,nil,8],[8,3,nil,nil,nil,4,nil,nil,2],[nil,nil,nil,nil,6,nil,7,nil,nil]])

