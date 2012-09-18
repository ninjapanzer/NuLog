class CreateCordinates < ActiveRecord::Migration
  def change
    create_table :cordinates do |t|
      t.decimal :mouseX
      t.decimal :mouseY
      t.decimal :screenX
      t.decimal :screenY
      t.references :record_storage, :polymorphic => true

      t.timestamps
    end
  end
end
