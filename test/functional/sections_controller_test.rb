require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
    @section = @page.sections.create!(text: 'foo')
  end

  test "should get new" do
    authenticate
    get :new, page_id: @page.to_param
    assert_response :success

    # View.
    assert_select "form[action=?]", "/pages/#{@page.to_param}/sections" do
      assert_fields %w[title text]
    end
  end

  test "should not get new when unauthorized" do
    get :new, page_id: @page.to_param
    assert_response :unauthorized
  end

  test "should create" do
    authenticate
    section = @page.sections.build(text: 'foo')
    assert_difference('@page.sections.count', 1) do
      post :create, section: section.attributes, page_id: @page.to_param
    end
    assert_redirected_to @page
  end

  test "should not create when unauthorized" do
    section = @page.sections.build(text: 'foo')
    assert_no_difference('@page.sections.count') do
      post :create, section: section.attributes, page_id: @page.to_param
    end
    assert_response :unauthorized
  end

  test "should not create and instead render new" do
    authenticate
    section = @page.sections.build
    assert_no_difference('@page.sections.count') do
      post :create, section: section.attributes, page_id: @page.to_param
    end
    assert_template :new
  end

  test "should get edit" do
    authenticate
    get :edit, id: @section.to_param, page_id: @page.to_param
    assert_response :success

    # View.
    assert_select "form[action=?]" , "/pages/#{@page.to_param}/sections/#{@section.to_param}" do
      assert_fields %w[title text]
    end
  end

  test "should not get edit when unauthorized" do
    get :edit, id: @section.to_param, page_id: @page.to_param
    assert_response :unauthorized
  end

  test "should update" do
    authenticate
    put :update, id: @section.to_param, section: @section.attributes, page_id: @page.to_param
    assert_redirected_to @page
  end

  test "should not update when unauthorized" do
    put :update, id: @section.to_param, section: @section.attributes, page_id: @page.to_param
    assert_response :unauthorized
  end

  test "should not update and instead render edit" do
    authenticate
    @section.text = nil
    put :update, id: @section.to_param, section: @section.attributes, page_id: @page.to_param
    assert_template :edit
  end

  test "should destroy" do
    authenticate
    assert_difference('@page.sections.count', -1) do
      delete :destroy, id: @section.to_param, page_id: @page.to_param
    end
    assert_redirected_to @page
  end

  test "should not destroy when unauthorized" do
    assert_no_difference('@page.sections.count') do
      delete :destroy, id: @section.to_param, page_id: @page.to_param
    end
    assert_response :unauthorized
  end
end
