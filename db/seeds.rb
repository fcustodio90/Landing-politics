puts 'CREATING POLITICIANS'

puts "--------CEO---------"
Politician.create(name: 'trump', starting_date: "19/01/1955")


puts "--------TIER 1 SUBORDINATES-----------"
Politician.create(name: 'Obama', starting_date: "05/02/1995")

puts "--------TIER 2 SUBORDINATES-----------"
Politician.create(name: 'ze1', starting_date: "03/09/1996")
Politician.create(name: 'ze2', starting_date: "03/02/1997")


puts "CREATING RELATIONSHIPS"

puts "CREATING TIER 1 RELATIONSHIPS"
Politician.find(1).active_relationships.create(subordinate_id: Politician.find(2).id)

puts "CREATING TIER 2 RELATIONSHIPS"
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(3).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(4).id)
