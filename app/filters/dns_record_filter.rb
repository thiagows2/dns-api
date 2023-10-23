# frozen_string_literal: true

class DnsRecordFilter
  def self.list_from_filters(filters)
    dns_records = DnsRecord.includes(:hostnames)
    dns_records = filter_included_hosts(dns_records, filters[:included]) if filters[:included].present?
    dns_records = filter_excluded_hosts(dns_records, filters[:excluded]) if filters[:excluded].present?
    dns_records = filter_page(dns_records, filters[:page]) if filters[:page].present?
    dns_records
  end

  def self.filter_included_hosts(dns_records, included)
    dns_records.select do |dns_record|
      included.all? { |hostname| dns_record.hosts.include?(hostname) }
    end
  end

  def self.filter_excluded_hosts(dns_records, excluded)
    dns_records.select do |dns_record|
      excluded.none? { |hostname| dns_record.hosts.include?(hostname) }
    end
  end

  def self.filter_page(dns_records, page)
    Kaminari.paginate_array(dns_records).page(page)
  end
end
