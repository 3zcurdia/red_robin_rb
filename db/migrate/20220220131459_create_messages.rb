class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :messaging_service, null: false, foreign_key: true, type: :uuid
      t.string :recipient
      t.text :content
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
