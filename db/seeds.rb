puts 'CREATING POLITICIANS'

puts "--------CEO---------"
Politician.create(name: 'trump', starting_date: "19/01/1955")


puts "--------TIER 1 SUBORDINATES-----------"
Politician.create(name: 'Obama', starting_date: "05/02/1995")
Politician.create(name: 'Hillary', starting_date: "07/03/1996")

puts "--------TIER 2 SUBORDINATES-----------"
Politician.create(name: 'ze1', starting_date: "03/09/1996")
Politician.create(name: 'ze2', starting_date: "03/02/1997")
Politician.create(name: 'ze3', starting_date: "04/03/1997")
Politician.create(name: 'ze4', starting_date: "04/04/1997")
Politician.create(name: 'ze5', starting_date: "05/01/1998")
Politician.create(name: 'ze6', starting_date: "07/07/1998")

puts "--------TIER  3 SUBORDINATES-----------"

Politician.create(name: 'ze7', starting_date: "07/03/2003")
Politician.create(name: 'ze8', starting_date: "07/05/2004")
Politician.create(name: 'ze9', starting_date: "12/08/2004")
Politician.create(name: 'ze10', starting_date: "21/06/2005")
Politician.create(name: 'ze11', starting_date: "24/07/2005")
Politician.create(name: 'ze12', starting_date: "19/08/2005")

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
