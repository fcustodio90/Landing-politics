# x = Date.today - 10000

# puts "---------Creating politicians------------"
# puts "-----------------------------------------"

# 23.times do
#   x += 420
#   politician = Politician.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", starting_date: x)
#   puts "#{politician.name}, in service since: #{politician.starting_date} created!"
# end

# puts "-------------#{Politician.count} politicians created---------------"

# puts "---------Creating Relationships------------"
# puts "-----------------------------------------"

# def set_relation(superior, array)

#   array.each do |relationship|
#     Politician.find(superior).active_relationships.create(subordinate_id: Politician.find(relationship).id)
#   end
# end

# array_one = (2..2).to_a
# array_two = (3..22ex).to_a


# set_relation(1, array_one)
# set_relation(2, array_two)

# puts "-------------Relationships Created---------------"



puts 'CREATING POLITICIANS'

puts "--------CEO---------"
Politician.create(name: 'Tony Montana', starting_date: "19/01/1955")


puts "--------TIER 1 SUBORDINATES-----------"
Politician.create(name: 'Marcellus Wallace', starting_date: "05/02/1995")


puts "--------TIER 2 SUBORDINATES-----------"
Politician.create(name: 'ze1', starting_date: "03/09/1996")
Politician.create(name: 'ze2', starting_date: "03/02/1997")

Politician.create(name: 'ze2', starting_date: "03/02/1998")
Politician.create(name: 'ze3', starting_date: "03/02/1999")
Politician.create(name: 'ze4', starting_date: "03/02/2000")

Politician.create(name: 'ze5', starting_date: "03/02/2001")
Politician.create(name: 'ze6', starting_date: "03/02/2002")
Politician.create(name: 'ze7', starting_date: "03/02/2003")

Politician.create(name: 'ze8', starting_date: "03/02/2004")
Politician.create(name: 'ze9', starting_date: "03/02/2005")
Politician.create(name: 'ze10', starting_date: "03/02/2006")

Politician.create(name: 'ze8', starting_date: "03/02/2007")
Politician.create(name: 'ze9', starting_date: "03/02/2008")
Politician.create(name: 'ze10', starting_date: "03/02/2009")

Politician.create(name: 'ze11', starting_date: "03/02/2010")
Politician.create(name: 'ze12', starting_date: "03/02/2011")
Politician.create(name: 'ze13', starting_date: "03/02/2012")

Politician.create(name: 'ze14', starting_date: "03/02/2013")
Politician.create(name: 'ze15', starting_date: "03/02/2014")
Politician.create(name: 'ze16', starting_date: "03/02/2015")


Politician.find(1).active_relationships.create(subordinate_id: Politician.find(2).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(3).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(4).id)

Politician.find(2).active_relationships.create(subordinate_id: Politician.find(5).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(6).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(7).id)

Politician.find(2).active_relationships.create(subordinate_id: Politician.find(8).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(9).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(10).id)

Politician.find(2).active_relationships.create(subordinate_id: Politician.find(11).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(12).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(13).id)

Politician.find(2).active_relationships.create(subordinate_id: Politician.find(14).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(15).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(16).id)

Politician.find(2).active_relationships.create(subordinate_id: Politician.find(17).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(18).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(19).id)

Politician.find(2).active_relationships.create(subordinate_id: Politician.find(20).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(21).id)
Politician.find(2).active_relationships.create(subordinate_id: Politician.find(22).id)
