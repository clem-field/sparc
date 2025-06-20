class CreateCatalogs < ActiveRecord::Migration[8.0]
  def change
    create_table :catalogs do |t|
      t.string :control_id
      t.text :family
      t.text :title
      t.text :language
      t.text :supplemental_guidance
      t.text :implementation_guidance
      t.text :nist_discussion
      t.text :nist_reference
      t.text :related_controls
      t.string :nist_sort_added
      t.string :nist_control_upper
      t.text :policy_reference
      t.text :overlay
      t.string :nist_control
      t.text :check
      t.text :fix

      t.timestamps
    end
  end
end
