class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.bigint :superior_id
      t.bigint :subordinate_id

      t.timestamps
    end
  end
end
