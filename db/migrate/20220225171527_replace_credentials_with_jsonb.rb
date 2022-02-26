class ReplaceCredentialsWithJsonb < ActiveRecord::Migration[7.0]
  def change
    add_column :messaging_services, :settings, :jsonb, default: '{}'
    remove_column :messaging_services, :webhook_url
    remove_column :messaging_services, :client_id
    remove_column :messaging_services, :client_secret
  end
end
