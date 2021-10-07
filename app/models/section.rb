# frozen_string_literal: true

class Section < ApplicationRecord
	enum title_alignment: %i[left rigth center], _prefix: :title_alignment
	enum content_alignment: %i[left rigth center], _prefix: :content_alignment

	validates :title, presence: true
	validates :content, length: { maximum: 350 }
	validates :sort_position, presence: true, uniqueness: true

	has_one_attached :first_image
	has_one_attached :second_image

	before_validation :update_sorting

	scope :active, -> { where(active: true) }

	scope :with_images, -> {
		eager_load(:first_image_attachment, :second_image_attachment)
	}

	def two_images_section?
		self.first_image_attachment.present? && self.second_image_attachment.present?
	end

	private

	def update_sorting
		self.sort_position = last_sorted_item_position + 1 if self.sort_position > last_sorted_item_position

		return unless should_update_sorting?

		Section.where(sort_position: self.sort_position..last_sorted_item_position).each do |section|
			section.update_column(:sort_position, section.sort_position + 1)
		end
	end

	def should_update_sorting?
		Section.all.pluck(:sort_position).include?(sort_position) && Section.find_by(sort_position: sort_position)&.id != id
	end

	def last_sorted_item_position
		return 0 if Section.count == 0

		Section.order(sort_position: :desc).first.sort_position
	end
end
