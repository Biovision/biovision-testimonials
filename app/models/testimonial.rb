# frozen_string_literal: true

# Testimonial
# 
# Attributes:
#   created_at [DateTime]
#   data [jsonb]
#   date [date]
#   image [SimpleImageUploader], optional
#   language_id [Language]
#   name [string]
#   priority [integer]
#   text [text]
#   url [string], optional
#   updated_at [DateTime]
#   visible [boolean]
class Testimonial < ApplicationRecord
  include Checkable
  include Toggleable
  include FlatPriority

  NAME_LIMIT = 100
  TEXT_LIMIT = 5000
  URL_LIMIT = 255

  toggleable :visible

  mount_uploader :image, SimpleImageUploader

  belongs_to :language

  after_initialize { self.date = Time.now.to_date if date.nil? }

  validates_presence_of :date, :name, :text
  validates_length_of :name, maximum: NAME_LIMIT
  validates_length_of :url, maximum: URL_LIMIT
  validates_length_of :text, maximum: TEXT_LIMIT

  scope :visible, -> { where(visible: true) }
  scope :for_language, ->(v) { where(language: v) }
  scope :list_for_administration, -> { ordered_by_priority }
  scope :list_for_visitors, -> { visible.ordered_by_priority }

  def self.entity_parameters
    %i[date image language_id name priority text url visible]
  end

  # @param [User] user
  def editable_by?(user)
    return false if user.nil?

    Biovision::Components::TestimonialsComponent.allow?(user)
  end
end
