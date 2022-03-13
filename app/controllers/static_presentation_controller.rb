# frozen_string_literal: true

class StaticPresentationController < ApplicationController
  def index
    @sections = Section.with_images.active.order(sort_position: :asc)
  end
end
