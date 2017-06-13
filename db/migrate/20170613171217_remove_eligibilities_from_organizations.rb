class RemoveEligibilitiesFromOrganizations < ActiveRecord::Migration
  def change
    remove_column :organizations, :eligibilities
  end
end
