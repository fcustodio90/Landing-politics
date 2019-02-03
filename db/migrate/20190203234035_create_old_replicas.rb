class CreateOldReplicas < ActiveRecord::Migration[5.2]
  def change
    create_table :old_replicas do |t|
      t.bigint :superior
      t.bigint :subordinate
      t.bigint :politician_id
      t.references :politician, foreign_key: true

      t.timestamps
    end
  end
end
