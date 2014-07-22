class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversations, index: true

      t.timestamps
    end
  end
end
