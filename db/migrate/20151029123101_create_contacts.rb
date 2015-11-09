class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.text :message
      t.date :date
      t.string :email
      t.boolean :seen

      t.timestamps null: false
    end
  end
end
