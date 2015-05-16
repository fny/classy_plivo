require 'minitest_helper'

describe ClassyPlivo::RestAPI do
  before do
    @arguments = ['auth_id', 'auth_token', 'https://api.plivo.com', 'v1']
    @classy_api = ClassyPlivo::RestAPI.new(*@arguments)
  end

  describe '#plivo_api' do
    it "returns a matching Plivo::RestAPI" do
      plivo_api = Plivo::RestAPI.new(*@arguments)
      assert_equal extract_api_attrs(plivo_api), extract_api_attrs(@classy_api.plivo_api)
    end
  end

  describe "calling a Plivo::RestAPI method that returns a response-like array" do
    it "returns the response wrapped in a ClassyPlivo::Response" do
      assert @classy_api.get_message.is_a?(ClassyPlivo::Response)
    end
  end

  describe "calling a Plivo::RestAPI method does not return a response-like array" do
    it "returns the response wrapped in a ClassyPlivo::Response" do
      new_auth_token = 'NEW_AUTH_TOKEN'
      result_from_assignment = (@classy_api.auth_token = new_auth_token)
      assert_equal new_auth_token, result_from_assignment
      assert_equal new_auth_token, @classy_api.auth_token
    end
  end

  describe "calling a Plivo::RestAPI method that does not exist" do
    it "raises a NoMethodError" do
      assert_raises(NoMethodError) { @classy_api.blah_blah_blah }
    end
  end

  private

  def extract_api_attrs(api)
    [api.auth_id, api.auth_token, api.url, api.version, api.api, api.headers]
  end
end
