class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :description
      t.text :details
      t.string :status, default: 'new'

      t.timestamps
    end
  end
end
