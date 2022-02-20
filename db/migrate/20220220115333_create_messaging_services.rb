class CreateMessagingServices < ActiveRecord::Migration[7.0]
  def change
    create_table :messaging_services, id: :uuid do |t|
      t.string :alias_name
      t.string :provider, default: "slack", index: true
      t.string :webhook_url
      t.string :client_id
      t.string :client_secret

      t.timestamps
    end
  end
end
