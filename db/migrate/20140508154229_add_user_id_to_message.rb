class AddUserIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer, index: true
  end
end
