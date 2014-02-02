class CreateRedirects < ActiveRecord::Migration
  def change
    create_table :redirects do |t|
      t.string :url
      t.string :short_url

      t.timestamps
    end
  end
end
