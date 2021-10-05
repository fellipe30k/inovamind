require "test_helper"

class QuoteSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_search = quote_searches(:one)
  end

  test "should get index" do
    get quote_searches_url, as: :json
    assert_response :success
  end

  test "should create quote_search" do
    assert_difference('QuoteSearch.count') do
      post quote_searches_url, params: { quote_search: { result_json: @quote_search.result_json, user_id: @quote_search.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show quote_search" do
    get quote_search_url(@quote_search), as: :json
    assert_response :success
  end

  test "should update quote_search" do
    patch quote_search_url(@quote_search), params: { quote_search: { result_json: @quote_search.result_json, user_id: @quote_search.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy quote_search" do
    assert_difference('QuoteSearch.count', -1) do
      delete quote_search_url(@quote_search), as: :json
    end

    assert_response 204
  end
end
