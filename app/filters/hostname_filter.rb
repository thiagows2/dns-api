# frozen_string_literal: true

class HostnameFilter
  def self.related_hostnames(filters)
    hostnames = Hostname.all
    hostnames = hostnames.where.not(hostname: filters[:included]) if filters[:included].present?
    hostnames = hostnames.where.not(hostname: filters[:excluded]) if filters[:excluded].present?
    hostnames.order(created_at: :asc).pluck(:hostname).uniq
  end
end
