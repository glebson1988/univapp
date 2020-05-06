# frozen_string_literal: true

class Student < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :student_courses
  has_many :courses, through: :student_courses

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase }

  has_secure_password
end
