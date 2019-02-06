LANDING.POLITICS

Stack used

```
ruby 2.6.0
rails 5.2.2
```

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install

```

Next, migrate the database:

```
$ rails db:migrate

```
Seed the database

```
$ rails db:seed
```

Run the server 

```
$ rails s
```

Models
```
Politician 

OldReplica

Event

Relationship
```

Politician methods

```ruby
add_subordinate(politician) # adds a politician instance as subordinate
```

```ruby
superior # finds the current superior
```

```ruby
subordinates_ids # queries active_relationships for ids
```

```ruby
sorted_subs # delivers subordinates instances sorted by ascending starting date
```

```ruby
event_locked # creates an instance of a lock event
```

```ruby
event_unlocked # creates an instance of unlock event
```
