require 'test_helper'

class Cb::AxientosControllerTest < ActionController::TestCase
  setup do
    @cb_axiento = cb_axientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cb_axientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cb_axiento" do
    assert_difference('Cb::Axiento.count') do
      post :create, cb_axiento: { nombre: @cb_axiento.nombre, proyecto_id: @cb_axiento.proyecto_id }
    end

    assert_redirected_to cb_axiento_path(assigns(:cb_axiento))
  end

  test "should show cb_axiento" do
    get :show, id: @cb_axiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cb_axiento
    assert_response :success
  end

  test "should update cb_axiento" do
    patch :update, id: @cb_axiento, cb_axiento: { nombre: @cb_axiento.nombre, proyecto_id: @cb_axiento.proyecto_id }
    assert_redirected_to cb_axiento_path(assigns(:cb_axiento))
  end

  test "should destroy cb_axiento" do
    assert_difference('Cb::Axiento.count', -1) do
      delete :destroy, id: @cb_axiento
    end

    assert_redirected_to cb_axientos_path
  end
end
