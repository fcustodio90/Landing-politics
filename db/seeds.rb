x = Date.today - 10000

puts "---------Creating politicians------------"
puts "-----------------------------------------"

39.times do
  x += 270
  politician = Politician.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", starting_date: x)
  puts "#{politician.name}, in service since: #{politician.starting_date} created!"
end

puts "-------------#{Politician.count} politicians created---------------"

puts "---------Creating Relationships------------"
puts "-----------------------------------------"

def set_relation(superior, array)

  array.each do |relationship|
    Politician.find(superior).active_relationships.create(subordinate_id: Politician.find(relationship).id)
  end
end

array_one = (2..3).to_a
array_two = (4..6).to_a
array_three = (7..9).to_a
array_four = (10..29).to_a
array_five = (30..31).to_a
array_six = (32..32).to_a
array_seven = (33..36).to_a
array_eight = (37..38).to_a
array_nine = (39..39).to_a


set_relation(1, array_one)
set_relation(2, array_two)
set_relation(3, array_three)
set_relation(4, array_four)
set_relation(5, array_five)
set_relation(6, array_six)
set_relation(7, array_seven)
set_relation(8, array_eight)
set_relation(9, array_nine)

puts "-------------Relationships Created---------------"
