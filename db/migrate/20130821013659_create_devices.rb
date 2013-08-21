class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :regid
      t.references :mobile_user

      t.timestamps
    end

    add_index :devices, :mobile_user_id
  end
end
