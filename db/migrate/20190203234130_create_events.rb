class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.boolean :locked
      t.bigint :politician_id
      t.references :politician, foreign_key: true

      t.timestamps
    end
  end
end
