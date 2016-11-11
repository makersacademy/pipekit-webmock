module Pipekit
  module WebMock
    class RequestSignatureSnippet
      def initialize(request_signature)
        @uri = request_signature.uri
        @body = request_signature.body
      end

      def pipedrive_request?
        @uri.hostname == "api.pipedrive.com"
      end

      def params
        extract_params(@uri.query)
      end

      def body
        extract_params(@body)
      end

      private

      def resource
        @uri.path.split("/")[2][0..-2]
      end

      def extract_params(query)
        params = Rack::Utils.parse_nested_query(query)
        params.reduce({}) do |result, (field, value)|
          field = Config.field_name(resource, field)
          value = Config.field_value(resource, field, value)
          result.tap { |result| result[field] = value }
        end.map { |k, v| "#{k}: #{v}" }.join("\n")
      end
    end
  end
end
