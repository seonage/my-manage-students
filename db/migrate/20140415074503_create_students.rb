class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :country
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
