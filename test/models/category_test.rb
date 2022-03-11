require 'test_helper'

class CategoryTest < ActiveSupport::TestCase 

    # method run before any test
    def setup 
        @category = Category.new(name: "sport")
    end

    test "Category should be valid" do 
        assert @category.valid?
    end

    test "Name should be present" do 
        @category.name = " "
        assert_not @category.valid?
    end

    test "Name should be unique" do 
        @category.save 
        @category2 = Category.new(name: "sport")
        assert_not @category2.valid?
    end

    test "Name should not be too long" do
        # Max will be 25 characters
        @category.name = "a" *26
        assert_not @category.valid?
    end

    test "Name should not be too short" do
        # Min will be 3 characters
        @category.name = "aa"
        assert_not @category.valid?
    end



end