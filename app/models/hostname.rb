# frozen_string_literal: true

class Hostname < ApplicationRecord
  has_many :dns_record_hostnames
  has_many :dns_records, through: :dns_record_hostnames
end
