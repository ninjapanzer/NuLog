class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.text :name
      t.text :value

      t.timestamps
    end
  end
end
