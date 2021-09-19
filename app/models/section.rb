# frozen_string_literal: true

class Section < ApplicationRecord
	enum title_alignment: %i[left rigth center], _prefix: :title_alignment
	enum content_alignment: %i[left rigth center], _prefix: :content_alignment

	validates :title, presence: true
	validates :content, presence: true, length: { minimum: 1, maximum: 350 }
	validates :sort_position, presence: true, uniqueness: true

	has_one_attached :mobile_image
	has_one_attached :desktop_image

	before_validation :update_sorting

	scope :active, -> { where(active: true) }

	private

	def update_sorting
		self.sort_position = last_sorted_item.sort_position + 1 if self.sort_position > last_sorted_item.sort_position

		return unless should_update_sorting?

		Section.where(sort_position: self.sort_position..last_sorted_item.sort_position).each do |section|
			section.update_column(:sort_position, section.sort_position + 1)
		end
	end

	def should_update_sorting?
		Section.all.pluck(:sort_position).include?(sort_position) && Section.find_by(sort_position: sort_position)&.id != id
	end

	def last_sorted_item
		Section.order(sort_position: :desc).first
	end
end
