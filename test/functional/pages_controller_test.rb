require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: @page.attributes
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should not create page and instead render new" do
    @page.title = nil

    assert_no_difference('Page.count') do
      post :create, page: @page.attributes
    end

    assert_template :new
  end

  test "should show page" do
    get :show, id: @page.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page.to_param
    assert_response :success
  end

  test "should update page" do
    put :update, id: @page.to_param, page: @page.attributes
    assert_redirected_to page_path(assigns(:page))
  end

  test "should not update page and instead render edit" do
    @page.title = nil

    put :update, id: @page.to_param, page: @page.attributes
    flunk 'should not update page', 'Flunked'

    assert_template :edit
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page.to_param
    end

    assert_redirected_to pages_path
  end
end
