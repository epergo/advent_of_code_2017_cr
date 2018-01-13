require "./advent_of_code/**"

module AdventOfCode
  extend self

  def run_3_part_1
    puts("347991 ==> #{Day3::Manhattan.new("347991").call}")
    puts("34799100 ==> #{Day3::Manhattan.new("34799100").call}")
    puts("347991000 ==> #{Day3::Manhattan.new("347991000").call}")
  end
end

AdventOfCode.run_3_part_1
