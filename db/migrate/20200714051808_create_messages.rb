class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.text:content
      t.bigint :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
