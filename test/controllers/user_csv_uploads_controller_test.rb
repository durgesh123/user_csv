require 'test_helper'

class UserCsvUploadsControllerTest < ActionController::TestCase
  setup do
    @user_csv_upload = user_csv_uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_csv_uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_csv_upload" do
    assert_difference('UserCsvUpload.count') do
      post :create, user_csv_upload: { name: @user_csv_upload.name }
    end

    assert_redirected_to user_csv_upload_path(assigns(:user_csv_upload))
  end

  test "should show user_csv_upload" do
    get :show, id: @user_csv_upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_csv_upload
    assert_response :success
  end

  test "should update user_csv_upload" do
    patch :update, id: @user_csv_upload, user_csv_upload: { name: @user_csv_upload.name }
    assert_redirected_to user_csv_upload_path(assigns(:user_csv_upload))
  end

  test "should destroy user_csv_upload" do
    assert_difference('UserCsvUpload.count', -1) do
      delete :destroy, id: @user_csv_upload
    end

    assert_redirected_to user_csv_uploads_path
  end
end
