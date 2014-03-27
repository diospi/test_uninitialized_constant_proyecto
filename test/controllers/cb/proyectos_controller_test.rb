require 'test_helper'

class Cb::ProyectosControllerTest < ActionController::TestCase
  setup do
    @cb_proyecto = cb_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cb_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cb_proyecto" do
    assert_difference('Cb::Proyecto.count') do
      post :create, cb_proyecto: { name: @cb_proyecto.name }
    end

    assert_redirected_to cb_proyecto_path(assigns(:cb_proyecto))
  end

  test "should show cb_proyecto" do
    get :show, id: @cb_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cb_proyecto
    assert_response :success
  end

  test "should update cb_proyecto" do
    patch :update, id: @cb_proyecto, cb_proyecto: { name: @cb_proyecto.name }
    assert_redirected_to cb_proyecto_path(assigns(:cb_proyecto))
  end

  test "should destroy cb_proyecto" do
    assert_difference('Cb::Proyecto.count', -1) do
      delete :destroy, id: @cb_proyecto
    end

    assert_redirected_to cb_proyectos_path
  end
end
