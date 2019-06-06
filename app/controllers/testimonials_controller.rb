# frozen_string_literal: true

# Handling testimonials
class TestimonialsController < AdminController
  before_action :set_entity, only: %i[edit update destroy]

  # post /testimonials/check
  def check
    @entity = Testimonial.instance_for_check(params[:entity_id], entity_parameters)

    render 'shared/forms/check'
  end

  # get /testimonials/new
  def new
    @entity = Testimonial.new
  end

  # post /testimonials
  def create
    @entity = Testimonial.new(entity_parameters)
    @entity.language = current_language
    if @entity.save
      form_processed_ok(admin_testimonial_path(id: @entity.id))
    else
      form_processed_with_error(:new)
    end
  end

  # get /testimonials/:id/edit
  def edit
  end

  # patch /testimonials/:id
  def update
    if @entity.update entity_parameters
      form_processed_ok(admin_testimonial_path(id: @entity.id))
    else
      form_processed_with_error(:edit)
    end
  end

  # delete /testimonials/:id
  def destroy
    flash[:notice] = t('testimonials.destroy.success') if @entity.destroy

    redirect_to(admin_testimonials_path)
  end

  protected

  def restrict_access
    component_restriction Biovision::Components::TestimonialsComponent
  end

  def set_entity
    @entity = Testimonial.find_by(id: params[:id])

    handle_http_404('Cannot find testimonial') if @entity.nil?
  end

  def entity_parameters
    params.require(:testimonial).permit(Testimonial.entity_parameters)
  end
end
