require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest 


    def setup 
        @adminUser = User.create(username: "example", email: "example@example.com", password: "password", admin: true)
    end

    test "get new category form and create category" do 
        sign_in_as(@adminUser, "password")
        get new_category_path
        assert_template 'categories/new'
        assert_difference 'Category.count', 1 do 
            post categories_path, params: {category: {name: "sport"}} 
            follow_redirect!
        end

        assert_template 'categories/index'
        assert_match "sport", response.body
    end


    test "invalid category submission results in failure" do 
        sign_in_as(@adminUser, "password")
        get new_category_path 
        assert_template 'categories/new'
        assert_no_difference 'Category.count' do 
            post categories_path, params: {category: {name: " "}}
        end

        assert_template 'categories/new'
        assert_select 'h2.card-title'
        assert_select 'div.card-text'
    end

end