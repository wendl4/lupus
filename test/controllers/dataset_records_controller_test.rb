require 'test_helper'

class DatasetRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dataset_records_index_url
    assert_response :success
  end

end
