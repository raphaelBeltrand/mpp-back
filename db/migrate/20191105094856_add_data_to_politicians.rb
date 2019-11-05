class AddDataToPoliticians < ActiveRecord::Migration[6.0]
  def change
    add_column :politicians, :first_name, :string
    add_column :politicians, :last_name, :string
    add_column :politicians, :gender, :string
    add_column :politicians, :dob, :datetime
    add_column :politicians, :pob, :string
    add_column :politicians, :department, :string
    add_column :politicians, :circonscription, :string
    add_column :politicians, :circonscription_number, :string
    add_column :politicians, :mandat_start, :datetime
    add_column :politicians, :group_sigle, :string
    add_column :politicians, :party, :string
    add_column :politicians, :email, :string
    add_column :politicians, :collaborators, :string, array: true
    add_column :politicians, :profession, :string
    add_column :politicians, :hemicycle_place, :string
    add_column :politicians, :slug, :string
    add_column :politicians, :url_an, :string
    add_column :politicians, :mandat_number, :string
    add_column :politicians, :twitter, :string
  end
end
