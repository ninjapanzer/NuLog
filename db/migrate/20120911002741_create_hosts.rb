class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.text :domain
      t.text :uri

      t.timestamps
    end
  end
end
