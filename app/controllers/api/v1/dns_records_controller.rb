# frozen_string_literal: true

module Api
  module V1
    class DnsRecordsController < ApplicationController
      before_action :validate_page_param, only: :index

      # GET /dns_records
      def index
        @dns_records = DnsRecordFilter.list_from_filters(filters_params)
        @hostnames = HostnameFilter.related_hostnames(filters_params)
      end

      # POST /dns_records
      def create
        dns_record = DnsRecord.new(dns_record_params)

        if dns_record.save
          render json: dns_record, status: :created
        else
          render json: dns_record.errors, status: :unprocessable_entity
        end
      end

      private

      def validate_page_param
        render json: { error: 'page param is required' }, status: :unprocessable_entity unless params[:page]
      end

      def dns_record_params
        params.require(:dns_records).permit(:ip, hostnames_attributes: [:hostname])
      end

      def filters_params
        params.permit(:page, :included, :excluded).tap do |whitelisted|
          whitelisted[:included] = params[:included].to_s.split(',')
          whitelisted[:excluded] = params[:excluded].to_s.split(',')
        end
      end
    end
  end
end
