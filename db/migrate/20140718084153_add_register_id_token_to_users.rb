class AddRegisterIdTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :register_id_token, :string
  end
end
