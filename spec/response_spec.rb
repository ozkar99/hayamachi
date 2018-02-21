require_relative '../lib/hayamichi_response.rb'

RSpec.describe Hayamichi::Response do
    context "with invalid response" do
        it "should raise invalid response error" do
            expect { Hayamichi::Response.new('herpa derpa') }.to raise_error Hayamichi::INVALID_RESPONSE_ERROR
        end
    end

    context "with valid response" do
        def valid_response
        end
    end
end