# frozen_string_literal: true

class Hostname < ApplicationRecord
  has_and_belongs_to_many :dns_records

  validates :hostname, presence: true
end
