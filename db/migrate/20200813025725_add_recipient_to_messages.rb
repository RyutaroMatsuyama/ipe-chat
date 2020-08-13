class AddRecipientToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :reciever, :bigint, null: true
    add_foreign_key :messages, :users, column: :reciever
  end
end
