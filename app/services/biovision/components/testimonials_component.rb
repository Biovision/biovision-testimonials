# frozen_string_literal: true

module Biovision
  module Components
    # Handler for testimonials component
    class TestimonialsComponent < BaseComponent
      SLUG = 'testimonials'

      def allow?(options = {})
        UserPrivilege.user_has_privilege?(user, :testimonials_manager)
      end
    end
  end
end
