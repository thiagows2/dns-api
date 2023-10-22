# frozen_string_literal: true

module Api
  module V1
    class DnsRecordsController < ApplicationController
      # GET /dns_records
      def index
        # TODO: Implement this action
      end

      # POST /dns_records
      def create
        @dns_record = DnsRecord.new(dns_record_params)

        if @dns_record.save
          render json: @dns_record, status: :created
        else
          render json: @dns_record.errors, status: :unprocessable_entity
        end
      end

      private

      def dns_record_params
        params.require(:dns_records).permit(:ip, hostnames_attributes: [:hostname])
      end

      def filters_params
        params.permit(:page, included: [], excluded: [])
      end
    end
  end
end
