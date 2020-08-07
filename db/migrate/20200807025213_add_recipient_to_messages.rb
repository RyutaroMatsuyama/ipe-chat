class AddRecipientToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :recipient, :string
  end
end
