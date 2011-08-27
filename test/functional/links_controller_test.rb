require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  # TODO: Remove dependence on existence of page.
  setup do
    Factory(:page)
    @link = Factory(:link)
  end

  test "should get new" do
    authenticate
    get :new
    assert_response :success

    # View.
    assert_select "form[action=?]", "/links" do
      assert_fields %w[title location]
    end
  end

  test "should not get new when unauthorized" do
    get :new
    assert_response :unauthorized
  end

  test "should create" do
    authenticate
    assert_difference('Link.count', 1) do
      post :create, link: @link.attributes
    end
    assert_redirected_to root_path
  end

  test "should not create when unauthorized" do
    assert_no_difference('Link.count') do
      post :create, link: @link.attributes
    end
    assert_response :unauthorized
  end

  test "should not create and instead render new" do
    authenticate
    @link.title = nil
    assert_no_difference('Link.count') do
      post :create, link: @link.attributes
    end
    assert_template :new
  end

  test "should get edit" do
    authenticate
    get :edit, id: @link.to_param
    assert_response :success

    # View.
    assert_select "form[action=?]", "/links/#{@link.to_param}" do
      assert_fields %w[title location]
    end
  end

  test "should not get edit when unauthorized" do
    get :edit, id: @link.to_param
    assert_response :unauthorized
  end

  test "should update" do
    authenticate
    put :update, id: @link.to_param, link: @link.attributes
    assert_redirected_to root_path
  end

  test "should not update when unauthorized" do
    put :update, id: @link.to_param, link: @link.attributes
    assert_response :unauthorized
  end

  test "should not update and instead render edit" do
    authenticate
    @link.title = nil
    put :update, id: @link.to_param, link: @link.attributes
    assert_template :edit
  end

  test "should destroy" do
    authenticate
    assert_difference('Link.count', -1) do
      delete :destroy, id: @link.to_param
    end
    assert_redirected_to root_path
  end

  test "should not destroy when unauthorized" do
    assert_no_difference('Link.count') do
      delete :destroy, id: @link.to_param
    end
    assert_response :unauthorized
  end

  # TODO: Write should sort, should not sort when unauthorized, more.
end
