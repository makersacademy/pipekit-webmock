require "rack"
require "webmock"

require "pipekit/webmock/request_signature_snippet"

module Pipekit
  module WebMock
    class UnregisteredPipedriveRequestError < StandardError
      WebMockNetConnectNotAllowedError = ::WebMock::NetConnectNotAllowedError unless const_defined?(:WebMockNetConnectNotAllowedError)

      def initialize(request_signature)
        request_signature_snippet = RequestSignatureSnippet.new(request_signature)

        return WebMockNetConnectNotAllowedError.new(request_signature) unless request_signature_snippet.pipedrive_request?
        text = [
          "Unregistered request to Pipedrive: #{request_signature}",
          "with params:",
          request_signature_snippet.params,
          "and body:",
          request_signature_snippet.body,
          "="*60
        ].compact.join("\n\n")

        super(text)
      end
    end
  end
end
