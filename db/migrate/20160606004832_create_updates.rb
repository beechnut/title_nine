class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :filename
      t.text :data
      t.boolean :performed, default: false, null: false

      t.timestamps null: false
    end
  end
end
