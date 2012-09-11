class CreateRecordStorages < ActiveRecord::Migration
  def change
    create_table :record_storages do |t|

      t.timestamps
    end
  end
end
