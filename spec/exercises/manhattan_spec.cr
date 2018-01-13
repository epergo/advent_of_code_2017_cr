describe(Day3::Manhattan) do
  it "Pt 1 ==> should return correct values" do
    (Day3::Manhattan.new("1").call).should     eq(0)
    (Day3::Manhattan.new("9").call).should     eq(2)
    (Day3::Manhattan.new("12").call).should    eq(3)
    (Day3::Manhattan.new("23").call).should    eq(2)
    (Day3::Manhattan.new("25").call).should    eq(4)
    (Day3::Manhattan.new("26").call).should    eq(5)
    (Day3::Manhattan.new("49").call).should    eq(6)
    (Day3::Manhattan.new("50").call).should    eq(7)
    (Day3::Manhattan.new("1024").call).should  eq(31)
  end
end
