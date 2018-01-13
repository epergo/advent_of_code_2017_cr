module Day3
  # Each square on the grid is allocated in a spiral pattern starting at
  # a location marked 1 and then counting up while spiraling outward.
  # For example, the first few squares are allocated like this:
  #
  # 17  16  15  14  13
  # 18   5   4   3  12
  # 19   6   1   2  11
  # 20   7   8   9  10
  # 21  22  23---> ...
  #
  # While this is very space-efficient (no squares are skipped), requested
  # data must be carried back to square 1 (the location of the only access port
  # for this memory system) by programs that can only move up, down, left, or
  # right. They always take the shortest path: the Manhattan Distance between
  # the location of the data and square 1.
  #
  # For example:
  #
  #     Data from square 1 is carried 0 steps, since it's at the access port.
  #     Data from square 12 is carried 3 steps, such as: down, left, left.
  #     Data from square 23 is carried only 2 steps: up twice.
  #     Data from square 1024 must be carried 31 steps.
  #
  # How many steps are required to carry the data from the square identified
  # in your puzzle input all the way to the access port?
  class Manhattan
    getter(input : Int32)

    def initialize(input : String)
      @input = input.to_i
    end

    def call
      level = find_level

      return 0 if level <= 0

      max_number = max_number_of_a_level(level)
      min_number = min_number_of_a_level(level)

      side          = generate_side(min_number, max_number)
      side_size     = calculate_side_size(side)
      initial_value = initial_manhattan_distance(level)
      distances     = manhattan_distances_of_a_side(initial_value, side_size)

      side.zip(distances).to_h[input]
    end

    # Given a number, find the level that includes it
    # Ex: Number 7 returns level 1
    # Level 1:
    # Min Value: 2
    # Max Value: 9
    private def find_level
      level = 0
      max_value = max_number_of_a_level(level)
      while max_value < input
        level += 1
        max_value = max_number_of_a_level(level)
      end
      level
    end

    # For level 2 returns 25
    private def max_number_of_a_level(level)
      4 * level * level + 4 * level + 1
    end

    # For level 2 returns 10
    private def min_number_of_a_level(level)
      max_number_of_a_level(level - 1) + 1
    end

    private def generate_side(min_value, max_value)
      (min_value..max_value).to_a
    end

    # Every side of the matrix has the same pattern of manhattan distances
    # This method returns the starting manhattan distance
    private def initial_manhattan_distance(level)
      2 * (level - 1) + 1
    end

    private def calculate_side_size(side)
      side.size / 4
    end

    private def manhattan_distances_of_a_side(initial, size_of_side)
      return [0]        if size_of_side == 1
      return [1, 2] * 4 if size_of_side == 2

      current_distance = initial
      side_distances = Array.new(size_of_side - 1) do |index|
        if (index + 1 < size_of_side / 2)
          current_distance -= 1
        else
          current_distance += 1
        end

        current_distance
      end

      # It always have 4 sides, multiply by 4 to generate full distances
      ([initial] + side_distances) * 4
    end
  end
end
