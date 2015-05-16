require 'minitest_helper'

describe ClassyPlivo::RestAPI do
  let(:success)   { [200, { 'api_id' => '1', 'message' => 'Wahoo!' }] }
  let(:error_400) { [400, { 'api_id' => '2', 'error' => 'Garbage request.' }] }
  let(:error_599) { [599, { 'api_id' => '3', 'error' => 'Server exploded.' }] }

  let(:classy_success) { ClassyPlivo::Response.new(success) }

  describe '#http_status' do
    it "returns the first value of the Plivo::RestAPI response array" do
      assert_equal 200, classy_success.http_status
    end
  end

  describe '#payload' do
    it "returns the second value of the Plivo::RestAPI response array" do
      assert_equal({ 'api_id' => '1', 'message' => 'Wahoo!' },
        classy_success.payload)
    end
  end

  describe "calling an method that matches a payload key" do
    it "returns the payload key value" do
      assert_equal 'Wahoo!', classy_success.message
    end
  end

  describe "calling an method that does not match a payload key" do
    it "raises a NoPayloadKeyError" do
      assert_raises(ClassyPlivo::Response::NoPayloadKeyError) {
        classy_success.blah_blah_blah}
    end
  end

  describe '#error?' do
    it "returns true for 4XX and 5XX errors" do
      assert ClassyPlivo::Response.new(error_400).error?
      assert ClassyPlivo::Response.new(error_599).error?
    end
  end

  describe '#has_payload_key?' do
    it "returns true when the payload key is present" do
      assert classy_success.has_payload_key?('message')
      refute classy_success.has_payload_key?('blah_blah_blah')
    end
  end
end
