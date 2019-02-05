class Politician < ApplicationRecord
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "superior_id",
                                  dependent:   :destroy

  has_many :oldreplicas
  has_many :events

  def add_subordinate(politician)
    if active_relationships.exists?(subordinate: politician)
      return true
    else
      active_relationships.create(subordinate: politician)
    end
  end

  def superior
    if !Relationship.find_by(subordinate: self).nil?
      id = Relationship.find_by(subordinate: self).superior_id
      Politician.find(id)
    end
  end

  def subordinates_ids
    active_relationships.pluck('subordinate_id')
  end

  def event_locked
    events.create(date: Date.today, locked: true)
  end

  def event_unlocked
    events.create(date: Date.today, locked: false)
  end

  def is_locked?
    if events_empty?
      false
    else
      events.last.locked == true
    end
  end

  def events_empty?
    events.empty?
  end

  def save_state
    if self.events_empty?
      set_locked
      event_locked
    else
      set_locked && event_locked if !self.is_locked?
    end
  end

  def recover_state
    if self.active_relationships.empty? && self.is_locked?
      set_unlocked
      event_unlocked
    end
  end

  private

      def set_locked
        # PHASE 1 check if he is the top superior

        if superior.nil?
          sub_ids = self.subordinates_ids

          hierarchy_array = self.active_relationships.includes(:subordinate).order("politicians.starting_date ASC")

          new_director = hierarchy_array.first.subordinate

          new_oldest_subordinate = hierarchy_array.second.subordinate

          sub_ids.each do |subordinate|
            OldReplica.create(superior: nil, subordinate: subordinate, politician_id: self.id)
          end

          new_director.active_relationships.each do |relationship|
            relationship.update_attribute(:superior, new_oldest_subordinate)
          end

          new_director.add_subordinate(new_oldest_subordinate)

          # destroy all active relationships
          self.active_relationships.destroy_all
        else
          # PHASE 2 - Destroy everything associated with self
          # Check who is his superior
          superior = self.superior
          # Check who are his subordinates
          sub_ids = self.subordinates_ids
          # Create a replica of his superior and subordinates at the moment he is locked
          if sub_ids.empty?
            OldReplica.create(superior: superior.id, subordinate: nil, politician_id: self.id)
          else
            sub_ids.each do |subordinate|
              OldReplica.create(superior: superior.id,
                                subordinate: subordinate, politician_id: self.id)
            end
          end
          # destroy all his relationships with subordinates
          self.active_relationships.destroy_all
          # destroy his active relationship with superior
          superior.active_relationships.where(subordinate: self).destroy_all

          # PHASE 3 - Create new hierarchy structure
          # Check if superior has a remaining subordinate
          superior_subs = superior.active_relationships
          # if he has then see who is the oldest one
          new_director = superior.active_relationships.includes(:subordinate).order("politicians.starting_date ASC").first.subordinate
          # for the oldest superior assign new relationships with subs_ids
          sub_ids.each do |id|
            new_director.add_subordinate(Politician.find(id))
          end
        end

      end

      def set_unlocked
        sub_ids = []
        superior_id = nil

        byebug

        OldReplica.where(politician: self).each do |replica|
          if replica.subordinate.nil?
            superior_id = replica.superior
          else
            if !Politician.find(replica.subordinate).is_locked?
              sub_ids << replica.subordinate
              superior_id = replica.superior
            end
          end
        end

        sub_ids.each do |id|
          Relationship.where(subordinate: id).destroy_all
        end

        sub_ids.each do |id|
          self.add_subordinate(Politician.find(id))
        end
        Politician.find(superior_id).add_subordinate(self)
        OldReplica.where(politician: self).destroy_all
      end

end



