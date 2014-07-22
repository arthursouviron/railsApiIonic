class AddDestinationIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :destination_id, :integer
  end
end
