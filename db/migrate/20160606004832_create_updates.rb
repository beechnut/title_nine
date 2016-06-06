class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :data
      t.boolean{default :performed

      t.timestamps null: false
    end
  end
end
