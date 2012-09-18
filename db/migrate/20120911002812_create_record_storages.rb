class CreateRecordStorages < ActiveRecord::Migration
  def change
    create_table :record_storages do |t|
      t.references :cordinate, :polymorphic => true
      t.references :header, :polymorphic => true
      t.references :host

      t.timestamps
    end
  end
end
