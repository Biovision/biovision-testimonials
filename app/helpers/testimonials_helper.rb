# frozen_string_literal: true

# Helper methods for handling testimonials
module TestimonialsHelper
  # @param [Testimonial] entity
  # @param [String] text
  # @param [Hash] options
  def admin_testimonial_link(entity, text = entity.name, options = {})
    link_to(text, admin_testimonial_path(id: entity.id), options)
  end
end
