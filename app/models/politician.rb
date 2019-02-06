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

  def sorted_subs
    active_relationships.includes(:subordinate).order("politicians.starting_date ASC")
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

        if superior.nil?
          sub_ids = self.subordinates_ids

          new_director = self.sorted_subs.first.subordinate

          sub_ids.each do |id|
            OldReplica.create(superior: nil, subordinate: id, politician_id: self.id)
          end

          self.active_relationships.destroy_all

          if Relationship.first.nil?
            sub_ids.each do |id|
              if !(id == new_director.id)
                new_director.add_subordinate(Politician.find(id))
              end
            end
          end

        else

          # get his subs
          sub_ids = self.subordinates_ids

          # get his superior
          superior = self.superior

          # check if subs are empty
          # if subs are empty it means he stays in the bottom of the pyramid and has no subordinates

          if sub_ids.empty?
            # create a back of his relationships at the current date
            OldReplica.create(superior: superior.id, subordinate: nil, politician_id: self.id)

            # destroy his relationship to the superior
            superior.active_relationships.where(subordinate: self).destroy_all

          else

            sub_ids.each do |id|
              OldReplica.create(superior: superior.id, subordinate: id, politician_id: self.id)
            end

            # time to assign his subs to his superior

            sub_ids.each do |id|
              superior.add_subordinate(Politician.find(id))
            end

            #destroy current relations

            self.active_relationships.destroy_all
            superior.active_relationships.where(subordinate: self).destroy_all
          end

        end

      end

      def set_unlocked

        superior = nil
        sub_ids = []

        OldReplica.where(politician: self).each do |replica|
          if replica.superior.nil?
            self.add_subordinate(Politician.find(replica.subordinate)) if !Politician.find(replica.subordinate).is_locked?
            OldReplica.where(politician: self).destroy_all
          else
            superior = Politician.find(replica.superior)
            sub_ids << replica.subordinate if !replica.subordinate.nil? && !Politician.find(replica.subordinate).is_locked?
          end
        end


        if !superior.nil?

          if !superior.is_locked?
            byebug

            superior.add_subordinate(self)

            sub_ids.each do |id|
              superior.active_relationships.where(subordinate: id).destroy_all
              self.add_subordinate(Politician.find(id))
            end

            OldReplica.where(politician: self).destroy_all

          else

            new_superior = Politician.find(OldReplica.where(politician: superior).last.superior)

            new_superior.add_subordinate(self)

            OldReplica.where(politician: self).destroy_all

          end
        end
      end

end



