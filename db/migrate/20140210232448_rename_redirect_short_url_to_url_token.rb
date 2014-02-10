class RenameRedirectShortUrlToUrlToken < ActiveRecord::Migration
  def change
    rename_column :redirects, :short_url, :url_token
  end
end
