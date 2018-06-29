module Day1
  class Part1
    def call(param)
      numbers = param.to_s.split("")
      size = numbers.size
      result = 0
      numbers.each_with_index do |number, index|
        if index >= size - 1
          next_number = numbers[0]
        else
          next_number = numbers[index + 1]
        end

        result += number.to_i if number == next_number
      end
      result
    end
  end
end
