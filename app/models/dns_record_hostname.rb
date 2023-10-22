# frozen_string_literal: true

class DnsRecordHostname < ApplicationRecord
  self.table_name = 'dns_records_hostnames'

  belongs_to :dns_record
  belongs_to :hostname, counter_cache: :dns_record_count
end
