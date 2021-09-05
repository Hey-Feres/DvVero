# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @sections = Section.active.order(sort_position: :asc)
  end
end
