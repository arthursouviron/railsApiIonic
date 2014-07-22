class AddContactIndexToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :contact_index, :integer
  end
end
