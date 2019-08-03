# frozen_string_literal: true

# Create tables for testimonials component
class CreateTestimonials < ActiveRecord::Migration[5.2]
  def up
    create_testimonials unless Testimonial.table_exists?
    create_component
    create_privilege
  end

  def down
    drop_table :testimonials if Testimonial.table_exists?
  end

  private

  def create_testimonials
    create_table :testimonials, comment: 'Client testimonial' do |t|
      t.references :language, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.boolean :visible, default: true, null: false
      t.integer :priority, limit: 2, default: 1, null: false
      t.timestamps
      t.date :date
      t.string :name, null: false
      t.string :image
      t.string :url
      t.text :text, null: false
      t.jsonb :data, default: {}, null: false
    end
  end

  def create_component
    criteria = { slug: Biovision::Components::TestimonialsComponent::SLUG }

    BiovisionComponent.create!(criteria) unless BiovisionComponent.where(criteria).exists?
  end

  def create_privilege
    Privilege.create(
      slug: 'testimonials_manager',
      name: 'Управляющий отзывами',
      administrative: true
    )
  end
end
