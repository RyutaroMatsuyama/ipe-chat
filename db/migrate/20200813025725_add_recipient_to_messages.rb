class AddRecipientToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :reciever_id, :bigint, null: true
  end
end
