# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :projects

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 3 },
            if: -> { new_record? || !password.nil? }
end
