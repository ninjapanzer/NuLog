class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.text :name
      t.text :value
      t.references :record_storage, :polymorphic => true
      
      t.timestamps
    end
  end
end
