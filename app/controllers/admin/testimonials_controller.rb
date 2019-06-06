# frozen_string_literal: true

# Administrative part of testimonials management
class Admin::TestimonialsController < AdminController
  include EntityPriority
  include ToggleableEntity

  before_action :set_entity, except: :index

  # get /admin/testimonials
  def index
    @collection = Testimonial.list_for_administration
  end

  # get /admin/testimonials/:id
  def show
  end

  private

  def set_entity
    @entity = Testimonial.find_by(id: params[:id])
    handle_http_404('Cannot find testimonial') if @entity.nil?
  end

  def restrict_access
    component_restriction Biovision::Components::TestimonialsComponent
  end
end
