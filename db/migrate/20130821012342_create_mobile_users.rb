class CreateMobileUsers < ActiveRecord::Migration
  def change
    create_table :mobile_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
