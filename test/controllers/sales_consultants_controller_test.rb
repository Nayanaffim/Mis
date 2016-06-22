require 'test_helper'

class SalesConsultantsControllerTest < ActionController::TestCase
  test "should get saleconsultant_new" do
    get :saleconsultant_new
    assert_response :success
  end

  test "should get saleconsultant_create" do
    get :saleconsultant_create
    assert_response :success
  end

  test "should get saleconsultant_edit" do
    get :saleconsultant_edit
    assert_response :success
  end

  test "should get saleconsultant_show" do
    get :saleconsultant_show
    assert_response :success
  end

  test "should get saleconsultant_update" do
    get :saleconsultant_update
    assert_response :success
  end

end
