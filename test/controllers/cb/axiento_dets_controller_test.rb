require 'test_helper'

class Cb::AxientoDetsControllerTest < ActionController::TestCase
  setup do
    @cb_axiento_det = cb_axiento_dets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cb_axiento_dets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cb_axiento_det" do
    assert_difference('Cb::AxientoDet.count') do
      post :create, cb_axiento_det: { name: @cb_axiento_det.name, proyecto_id: @cb_axiento_det.proyecto_id }
    end

    assert_redirected_to cb_axiento_det_path(assigns(:cb_axiento_det))
  end

  test "should show cb_axiento_det" do
    get :show, id: @cb_axiento_det
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cb_axiento_det
    assert_response :success
  end

  test "should update cb_axiento_det" do
    patch :update, id: @cb_axiento_det, cb_axiento_det: { name: @cb_axiento_det.name, proyecto_id: @cb_axiento_det.proyecto_id }
    assert_redirected_to cb_axiento_det_path(assigns(:cb_axiento_det))
  end

  test "should destroy cb_axiento_det" do
    assert_difference('Cb::AxientoDet.count', -1) do
      delete :destroy, id: @cb_axiento_det
    end

    assert_redirected_to cb_axiento_dets_path
  end
end
