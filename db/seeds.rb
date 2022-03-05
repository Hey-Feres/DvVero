# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.production?
	# Dir[Rails.root.join('public','imgs', '*')].sort.each_with_index do |file, i|
	12.times.each do |i|
		section = Section.new
		section.sort_position = i + 1
		section.active = true
		section.desktop_image.attach(
			io: File.open( "#{Rails.root.join('public','imgs').to_s}/desktop_#{i+1}.jpg" ),
			filename: "desktop_#{i+1}.jpg"
		)
		section.mobile_image.attach(
			io: File.open( "#{Rails.root.join('public','imgs').to_s}/mobile_#{i+1}.jpg" ),
			filename: "mobile_#{i+1}.jpg"
		)
		section.save!
	end
else
	alignments = %w[left rigth center]

	10.times do |i|
		alignment = alignments.sample
		text_color = Faker::Color.hex_color

		Section.create(
			title: 'Lorem Ipsum',
			content: Faker::Movies::Ghostbusters.quote,
			sort_position: i + 1,
			title_alignment: alignment,
			content_alignment: alignment,
			background_color: Faker::Color.hex_color,
			title_color: text_color,
			content_color: text_color,
			active: true
		)
	end	
end

