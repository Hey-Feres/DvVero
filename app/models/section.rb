# frozen_string_literal: true

class Section < ApplicationRecord
	enum title_alignment: %i[left rigth center], _prefix: :title_alignment
	enum content_alignment: %i[left rigth center], _prefix: :content_alignment

	validates :title, presence: true
	validates :content, presence: true, length: { minimum: 1, maximum: 350 }
	validates :sort_position, presence: true

	has_one_attached :mobile_image
	has_one_attached :desktop_image

	before_save :update_sorting

	scope :active, -> { where(active: true) }

	private

	def update_sorting
		return unless should_update_sorting?

		current_section_w_sort_num = Section.find_by(sort_position: sort_position)
		current_section_w_sort_num.update_column(:sort_position, Section.order(sort_position: :asc).last.sort_position + 1)

		# Section.order(sort_position: :asc).each_with_index { |section, i| section.update_column(:sort_position, i + 1) }
	end

	def should_update_sorting?
		Section.all.pluck(:sort_position).include?(sort_position) && Section.find_by(sort_position: sort_position)&.id != id
	end
end
