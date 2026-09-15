require "test_helper"

class Admin::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "index responds successfully" do
    get admin_projects_path

    assert_response :success
  end
end
