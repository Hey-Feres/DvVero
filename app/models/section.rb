# frozen_string_literal: true

class Section < ApplicationRecord
	include ApplicationHelper

	enum title_alignment: %i[left rigth center], _prefix: :title_alignment
	enum content_alignment: %i[left rigth center], _prefix: :content_alignment

	validates :title, presence: true
	validates :content, presence: true, length: { minimum: 1, maximum: 350 }
	validates :sort_position, presence: true

	has_one_attached :mobile_image
	has_one_attached :desktop_image

	before_save :update_sorting
	before_save :format_colors

	scope :active, -> { where(active: true) }

	private

	def format_colors
		self.background_color = "##{background_color}" if background_color&.chars&.first != '#'
		self.title_color = "##{title_color}" if title_color&.chars&.first != '#'
		self.content_color = "##{content_color}" if content_color&.chars&.first != '#'
		
		self.background_filter_color = 	if is_light_color? content_color
																	  	'#000000'
																		else
																			'#FFFFFF'
																		end
	end

	def update_sorting
		return unless should_update_sorting?

		section = Section.find_by(sort_position: sort_position)
		section.update(sort_position: section.sort_position + 1)
	end

	def should_update_sorting?
		Section.all.pluck(:sort_position).include?(sort_position && Section.find_by(sort_position: sort_position)&.id != id)
	end

	def order_sorting
		sections = Section.all.order(sort_position: :asc)

		sections.size.times do |i|
			sections[i].update_column(:sort_position, i + 1)
		end
	end
end
