# frozen_string_literal: true

json.total_records @dns_records.total_count

json.records @dns_records do |dns_record|
  json.id dns_record.id
  json.ip_address dns_record.ip
end

json.related_hostnames @hostnames.map do |hostname|
  count = @dns_records.count { |dns| dns.hosts.include?(hostname) }
  json.hostname hostname
  json.count count
end
