class AddEligibilitiesToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :eligibilities, :string
  end
end
