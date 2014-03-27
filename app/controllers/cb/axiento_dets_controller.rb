class Cb::AxientoDetsController < ApplicationController
  before_action :set_cb_axiento_det, only: [:show, :edit, :update, :destroy]

  # GET /cb/axiento_dets
  # GET /cb/axiento_dets.json
  def index
    @cb_axiento_dets = Cb::AxientoDet.all
  end

  # GET /cb/axiento_dets/1
  # GET /cb/axiento_dets/1.json
  def show
  end

  # GET /cb/axiento_dets/new
  def new
    @cb_axiento_det = Cb::AxientoDet.new
  end

  # GET /cb/axiento_dets/1/edit
  def edit
  end

  # POST /cb/axiento_dets
  # POST /cb/axiento_dets.json
  def create
    @cb_axiento_det = Cb::AxientoDet.new(cb_axiento_det_params)

    respond_to do |format|
      if @cb_axiento_det.save
        format.html { redirect_to @cb_axiento_det, notice: 'Axiento det was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cb_axiento_det }
      else
        format.html { render action: 'new' }
        format.json { render json: @cb_axiento_det.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cb/axiento_dets/1
  # PATCH/PUT /cb/axiento_dets/1.json
  def update
    respond_to do |format|
      if @cb_axiento_det.update(cb_axiento_det_params)
        format.html { redirect_to @cb_axiento_det, notice: 'Axiento det was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @cb_axiento_det }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cb_axiento_det.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cb/axiento_dets/1
  # DELETE /cb/axiento_dets/1.json
  def destroy
    @cb_axiento_det.destroy
    respond_to do |format|
      format.html { redirect_to cb_axiento_dets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cb_axiento_det
      @cb_axiento_det = Cb::AxientoDet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cb_axiento_det_params
      params.require(:cb_axiento_det).permit(:name, :proyecto_id)
    end
end
