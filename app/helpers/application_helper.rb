# frozen_string_literal: true

module ApplicationHelper
	def is_light_color? color
		return true unless color.present?

    rgb = color.to_rgb
    r = rgb[0]; g = rgb[1]; b = rgb[2]

    hsp = ('%.2f' % Math.sqrt(0.299 * (r * r) + 0.587 * (g * g) + 0.114 * (b * b))).to_f

    return hsp > 127.5
	end
end
