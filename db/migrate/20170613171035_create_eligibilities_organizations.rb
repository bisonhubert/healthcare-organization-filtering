class CreateEligibilitiesOrganizations < ActiveRecord::Migration
  def change
    create_table :eligibilities_organizations, id: false do |t|
      t.integer :eligibility_id
      t.integer :organization_id
    end

    add_index :eligibilities_organizations, :eligibility_id
    add_index :eligibilities_organizations, :organization_id
  end
end
