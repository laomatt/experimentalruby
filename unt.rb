   class CreditCard
      attr_reader :sum_array, :card_number, :array

      def initialize(card_number)
        @card_number = card_number
        if card_number.to_s.length != 16
          raise ArgumentError.new ("This is not a valid credit card number.")
        end
        @array = card_number.to_s.split("")
        @sum_number=0
      end

      def separate_digit
        first_array = []
        @array = array.each_index { |index| first_array << array[index] if index.even?}
        second_array = array - first_array
        multiple_array = first_array.map {|x| (x.to_i * 2).to_s}.join("").split("")
        @sum_number = (second_array.concat(multiple_array).map { |int| int.to_i}).inject(0){ |sum, num| sum + num}
      end

      def check_card
        first_array = []
        @array = array.each_index { |index| first_array << array[index] if index.even?}
        second_array = array - first_array
        multiple_array = first_array.map {|x| (x.to_i * 2).to_s}.join("").split("")
        @sum_number = (second_array.concat(multiple_array).map { |int| int.to_i}).inject(0){ |sum, num| sum + num}
        @sum_number%10 == 0
      end
    end


# 1. DRIVER TESTS GO BELOW THIS LINE

test = CreditCard.new(4408041234567906)
test2 = CreditCard.new(4408041234567901)

p test.separate_digit
p test.check_card==false
#p test2.separate_digit
p test2.check_card== true
