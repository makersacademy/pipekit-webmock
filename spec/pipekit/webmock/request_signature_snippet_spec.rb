require "spec_helper"

module Pipekit
  module WebMock
    describe RequestSignatureSnippet do
      let(:create_person_request) {
        ::WebMock::RequestSignature.new(:get,
                                      "https://api.pipedrive.com/v1/persons?api_token=123",
                                      {body: "email=octocat@gmail.com&99912a=99"})
      }

      subject(:request_signature_snippet) { described_class.new(create_person_request) }

      it "knows if the request is a request to Pipedrive" do
        non_pd_request = ::WebMock::RequestSignature.new(:get, "https://api.github.com/")
        request_signature_snippet_non_pd = described_class.new(non_pd_request)

        expect(request_signature_snippet).to be_pipedrive_request
        expect(request_signature_snippet_non_pd).not_to be :pipedrive_request
      end

      it "prints out nicely formatted params" do
        formatted_params = "api_token: 123"

        expect(request_signature_snippet.params).to eq(formatted_params)
      end

      it "prints out nicely formatted body" do
        formatted_body = "email: octocat@gmail.com\ncustom_field: custom_value"

        expect(request_signature_snippet.body).to eq(formatted_body)
      end
    end
  end
end
