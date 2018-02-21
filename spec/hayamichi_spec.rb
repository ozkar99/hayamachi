require_relative '../lib/hayamichi'

RSpec.describe Hayamichi do
    def valid_hm
        Hayamichi.new('http://google.com', method: :post)
    end

    def hm_data
        {name: 'namerino', email: 'test@gmail.com'}
    end

    context "when initializing with invalid uri" do
        it "should raise error" do
            bad_uri = "derpa.com/herpa"
            expect { Hayamichi.new bad_uri }.to raise_error Hayamichi::INVALID_URI_ERROR
        end
    end

    context "when initializing with invalid method" do
        it "should raise error" do
            expect { Hayamichi.new('http://google.com', method: :delete) }.to raise_error Hayamichi::INVALID_METHOD_ERROR
        end
    end

    context "when initialized with good parameters" do
        it "should not raise error" do
            expect { valid_hm }.not_to raise_error
        end

        it "should raise on submit when data is not set"  do
            expect { valid_hm.submit }.to raise_error Hayamichi::DATA_NIL_ERROR
        end

        it "should set method to get when method is get" do
            hm = Hayamichi.new('http://google.com', method: :get)
            expect(hm.method).to eq(:get)
        end

        it "should set method to post when method is post" do
            hm = Hayamichi.new('http://google.com', method: :post)
            expect(hm.method).to eq(:post)
        end

        it "should set method to post when no method is given" do
            hm = Hayamichi.new('http://google.com')
            expect(hm.method).to eq(:post)
        end
    end
end