# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @sections = Section.with_images.active.order(sort_position: :asc)
  end
end
