class AddZipToStudents < ActiveRecord::Migration
  def change
    add_column :students, :zip, :string
  end
end
