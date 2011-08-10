require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = Factory(:page)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)

    # View.
    assert_select 'td', @page.title
    assert_select 'td', @page.text
  end

  test "should get new" do
    authenticate
    get :new
    assert_response :success

    # View.
    assert_select "form[action=?]", "/pages" do
      assert_fields %w[title text]
    end
  end

  test "should not get new when unauthorized" do
    get :new
    assert_response :unauthorized
  end

  test "should create" do
    authenticate
    assert_difference('Page.count', 1) do
      post :create, page: @page.attributes
    end
    assert_redirected_to page_path(assigns(:page))
  end

  test "should not create when unauthorized" do
    assert_no_difference('Page.count') do
      post :create, page: @page.attributes
    end
    assert_response :unauthorized
  end

  test "should not create and instead render new" do
    authenticate
    @page.title = nil
    assert_no_difference('Page.count') do
      post :create, page: @page.attributes
    end
    assert_template :new
  end

  test "should show" do
    get :show, id: @page.to_param
    assert_response :success

    # View.
    assert_select 'h1', @page.title
    assert_select 'div', @page.text
  end

  test "should get edit" do
    authenticate
    get :edit, id: @page.to_param
    assert_response :success

    # View.
    assert_select "form[action=?]", "/pages/#{@page.to_param}" do
      assert_fields %w[title text]
    end
  end

  test "should not get edit when unauthorized" do
    get :edit, id: @page.to_param
    assert_response :unauthorized
  end

  test "should update" do
    authenticate
    put :update, id: @page.to_param, page: @page.attributes
    assert_redirected_to page_path(assigns(:page))
  end

  test "should not update when unauthorized" do
    put :update, id: @page.to_param, page: @page.attributes
    assert_response :unauthorized
  end

  test "should not update and instead render edit" do
    authenticate
    @page.title = nil
    put :update, id: @page.to_param, page: @page.attributes
    assert_template :edit
  end

  test "should destroy" do
    authenticate
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page.to_param
    end
    assert_redirected_to pages_path
  end

  test "should not destroy when unauthorized" do
    assert_no_difference('Page.count') do
      delete :destroy, id: @page.to_param
    end
    assert_response :unauthorized
  end

  test "should redirect to home" do
    get :home
    assert_redirected_to Page.first
  end

  test "should not redirect to home and instead return 404" do
    Page.destroy_all
    get :home
    assert_response :not_found
  end
end
