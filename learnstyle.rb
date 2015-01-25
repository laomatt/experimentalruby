def ask(question, line, key)
  guide = ['I','II','III','IV']
  puts (line+1).to_s + ') ' + question

  #ask for choice 1
  while true
    print 'Choice 1: '
    choice_1 = gets.chomp.upcase
    if (choice_1 == 'A' || choice_1 == 'B' || choice_1 == 'cC' || choice_1 == 'D')

        #after answering choice 1, ask for choice 2
        while true
          print 'Choice 2: '
          choice_2 = gets.chomp.upcase
          if (choice_2 == choice_1)
            puts 'Your second choice cannot be the same as your first choice.'
          elsif (choice_2 == 'A' || choice_2 == 'B' || choice_2 == 'C' || choice_2 == 'D')
            #puts [guide[key[line].index(choice_1)], guide[key[line].index(choice_2)]].join (', ') #uncomment line to see what it returns
            return [guide[key[line].index(choice_1)], guide[key[line].index(choice_2)]]
          else
            puts 'Please answer "a", "b", "c" or "d" (it cannot be the same as the first choice).'
          end
        end

    else
        puts 'Please answer "a", "b", "c" or "d".'
    end
  end
end

def print_score results
  cs_num = results.count('I')*4
  as_num = results.count('II')*4
  ar_num = results.count('III')*4
  cr_num = results.count('IV')*4

  puts 'Here are your results:'
  puts cs_num.to_s + ' Concrete Sequential (CS)'
  puts as_num.to_s + ' Abstract Sequential (AS)'
  puts ar_num.to_s + ' Abstract Random (AR)'
  puts cr_num.to_s + ' Concrete Random (CR)'
  puts

  if cs_num >= as_num && cs_num >= ar_num && cs_num >= cr_num
    puts 'Concrete Sequential Thinkers tend to be based in reality. They process information in an ordered, sequential, linear way.'
  end
  if as_num >= cs_num && as_num >= ar_num && as_num >= cr_num
    puts 'Concrete Random Thinkers are experimenters.'
  end
  if ar_num >= cs_num && ar_num >= as_num && ar_num >= cr_num
    puts 'Abstract Random Thinkers organize information through reflection, and thrive in unstructured, people-oriented environments.'
  end
  if cr_num >= cs_num && cr_num >= as_num && cr_num >= ar_num
    puts 'Abstract Sequential Thinkers love the world of theory and abstract thought.'
  end
end

key = [['C','D','A','B'],['A','C','B','D'],['B','A','C','D'],['B','C','A','D'],['A','C','B','D'],['B','C','A','D'],['B','D','C','A'],['C','A','B','D'],['D','A','B','C'],['A','C','B','D'],['D','B','C','A'],['C','D','A','B'],['B','D','C','A'],['A','C','D','B'],['A','C','B','D']]

results = []

puts 'There are 15 questions. Read each set of words and choose the two within each set that best describe you. Type in "a", "b", "c" or "d".'
puts

#It took me a while to figure out to use the concat method instead of push!
#Otherwise my print_score method won't work. It kept returning 0 and I didn't know why, until I realized the push method adds the argument array into the first array as a nested array.
results.concat(ask('a. imaginative | b. investigative | c. realistic | d. analytical', 0, key))
results.concat(ask('a. organised | b. adaptable | c. critical | d. inquisitive', 1, key))
results.concat(ask('a. debating | b. getting to the point | c. creating | d. relating', 2, key))
results.concat(ask('a. personal | b. practical | c. academic | d. adventurous', 3, key))
results.concat(ask('a. precise | b. flexible | c. systematic | d. inventive', 4, key))
results.concat(ask('a. sharing | b. orderly | c. sensible | d. independent', 5, key))
results.concat(ask('a. competitive | b. perfectionist | c. cooperative | d. logical', 6, key))
results.concat(ask('a. intellectual | b. sensitive | c. hardworking | d. risk-taking', 7, key))
results.concat(ask('a. reader | b. people person | c. problem solver | d. planner', 8, key))
results.concat(ask('a. memorise | b. associate | c. think-through | d originate', 9, key))
results.concat(ask('a. changer | b. judger | c. spontaneous | d. wants direction', 10, key))
results.concat(ask('a. communicating | b. discovering | c. cautious | d. reasoning', 11, key))
results.concat(ask('a. challenging | b. practising | c. caring | d. examining', 12, key))
results.concat(ask('a. completing work | b. seeing possibilities | c. gaining ideas | d. interpreting', 13, key))
results.concat(ask('a. doing | b. feeling | c. thinking | d. experimenting', 14, key))

puts
puts 'Thanks for taking the personal thinking style test.'
puts
#puts results.join(', ')
print_score results