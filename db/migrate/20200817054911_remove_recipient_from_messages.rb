class RemoveRecipientFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :recipient, :string
  end
end
