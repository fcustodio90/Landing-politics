puts 'CREATING POLITICIANS'

puts "--------CEO---------"
Politician.create(name: 'trump', house_years: 23)


puts "--------TIER 1 SUBORDINATES-----------"
Politician.create(name: 'Obama', house_years: 43)
Politician.create(name: 'Hillary', house_years: 27)

puts "--------TIER 2 SUBORDINATES-----------"
Politician.create(name: 'ze1', house_years: 12)
Politician.create(name: 'ze2', house_years: 11)
Politician.create(name: 'ze3', house_years: 10)
Politician.create(name: 'ze4', house_years: 9)
Politician.create(name: 'ze5', house_years: 8)
Politician.create(name: 'ze6', house_years: 7)

puts "--------TIER  3 SUBORDINATES-----------"

Politician.create(name: 'ze7', house_years: 6)
Politician.create(name: 'ze8', house_years: 5)
Politician.create(name: 'ze9', house_years: 4)
Politician.create(name: 'ze10', house_years: 3)
Politician.create(name: 'ze11', house_years: 2)
Politician.create(name: 'ze12', house_years: 1)

puts "CREATING RELATIONSHIPS"

puts "CREATING TIER 1 RELATIONSHIPS"
Politician.find(1).active_relationships.create(subordinate_id: Politician.find(2).id)
Politician.find(1).active_relationships.create(subordinate_id: Politician.find(3).id)

puts "CREATING TIER 2 RELATIONSHIPS"
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(4).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(5).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(6).id)

Politician.find(3).active_relationships.create(subordinate_id: Politician.find(7).id)
Politician.find(3).active_relationships.create(subordinate_id: Politician.find(8).id)
Politician.find(3).active_relationships.create(subordinate_id: Politician.find(9).id)

puts "Creating TIER 3 RELATIONSHIPS"

Politician.find(4).active_relationships.create(subordinate_id: Politician.find(10).id)
Politician.find(5).active_relationships.create(subordinate_id: Politician.find(11).id)
Politician.find(6).active_relationships.create(subordinate_id: Politician.find(12).id)
Politician.find(7).active_relationships.create(subordinate_id: Politician.find(13).id)
Politician.find(8).active_relationships.create(subordinate_id: Politician.find(14).id)
Politician.find(9).active_relationships.create(subordinate_id: Politician.find(15).id)
