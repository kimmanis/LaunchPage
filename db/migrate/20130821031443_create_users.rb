class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :code
      t.integer :count

      t.timestamps
    end
  end
end
