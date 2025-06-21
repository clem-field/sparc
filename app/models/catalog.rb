class Catalog < ApplicationRecord
  :control_id
  :priority
  has_rich_text :family
  has_rich_text :title
  has_rich_text :language
  has_rich_text :supplemental_guidance
  has_rich_text :implementation_guidance
  has_rich_text :nist_discussion
  has_rich_text :nist_reference
  has_rich_text :related_controls
  has_rich_text :pvt_ref
  has_rich_text :overlay
  has_rich_text :nist_control
  has_rich_text :check
  has_rich_text :fix
  validates :control_id, :family, :title, :language, :supplemental_guidance,
  :implementation_guidance, :nist_reference, :related_controls, :pvt_ref,
  :overlay, :nist_control, :check, :fix, presence: true
end
