class RemoveRecieverFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :reciever, :bigint
  end
end
