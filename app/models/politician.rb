class Politician < ApplicationRecord
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "superior_id",
                                  dependent:   :destroy

  has_many :oldreplicas
  has_many :events
end
