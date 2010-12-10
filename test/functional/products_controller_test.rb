require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  
  context "Get index" do
    setup { get :index }

    should respond_with :success
    should render_template :index
    should_not set_the_flash
  end
  
  context "Get controller variables" do
    setup { get :index }
    
    should assign_to :products  
  end

  test "Should get product by /product/:id" do
    assert_routing '/product/1', { :controller => "product", :action => "show", :id => "1" }
  end
  #TODO Put route testing outside resources/controllers
    
end

