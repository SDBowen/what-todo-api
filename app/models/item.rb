# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :project
  after_initialize :set_completed

  validates :description, presence: true

  private

  def set_completed
    self.completed = false
  end
end
