require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    def setup
        @category = Category.create(name: "sports")
    end
    
    test 'should get category index' do
        get categories_path
        assert_response :success
    end

    test 'should get new' do
        get new_category_path
        assert_response :success
    end

    test 'should ge show' do
        get category_path(@category)
        assert_response :success
    end
end