class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :begins_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
