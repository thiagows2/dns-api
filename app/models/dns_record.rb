# frozen_string_literal: true

class DnsRecord < ApplicationRecord
  has_and_belongs_to_many :hostnames

  accepts_nested_attributes_for :hostnames

  validates :ip, presence: true

  before_validation :find_or_create_hostnames

  def hosts
    hostnames.pluck(:hostname)
  end

  private

  def find_or_create_hostnames
    self.hostnames = hosts.map { |h| Hostname.find_or_create_by(hostname: h) } unless hosts.empty?
  end
end
