module Matt
  def Matt.add(num1, num2)
    return num2+num1
  end

  TANG="matt"
end


module Lao
  def Lao.add(num1, num2)
    return num2+num1*6
  end

  TANG="lksdfjs"
end



#puts Matt.add(3,4)

#puts Matt::TANG
module RubyMonk
  module Parser
    class TextParser
      def self.parse(input)
        # define method
        #input.upcase.chars
        input.upcase.split("")
      end
    end
  end
end



module Kata
  A = 50
  module Dojo
    B = 9
    A = 1

    class ScopeIn
      def push
        A
      end
    end
  end
end

A = 10