class ChangeColumnNameForPartyInPolitician < ActiveRecord::Migration[6.0]
  def change
    rename_column :politicians, :party, :party_name
  end
end
