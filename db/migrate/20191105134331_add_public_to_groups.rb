class AddPublicToGroups < ActiveRecord::Migration[6.0]
  def change
    enable_extension "unaccent"
    add_column :groups, :public, :boolean
  end
end
