describe(Day1::Part1) do
  it do
    resolver = Day1::Part1.new
    resolver.call(1122).should      eq(3)
    resolver.call(1111).should      eq(4)
    resolver.call(1234).should      eq(0)
    resolver.call(91212129 ).should eq(9)
  end
end
