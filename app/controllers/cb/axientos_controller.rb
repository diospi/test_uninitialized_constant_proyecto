class Cb::AxientosController < ApplicationController
  before_action :set_cb_axiento, only: [:show, :edit, :update, :destroy]

  # GET /cb/axientos
  # GET /cb/axientos.json
  def index
    @cb_axientos = Cb::Axiento.all
  end

  # GET /cb/axientos/1
  # GET /cb/axientos/1.json
  def show
  end

  # GET /cb/axientos/new
  def new
    @axiento = Cb::Axiento.new
    @axiento.axiento_dets.build
  end

  # GET /cb/axientos/1/edit
  def edit
  end

  # POST /cb/axientos
  # POST /cb/axientos.json
  def create
    @axiento = Cb::Axiento.new(cb_axiento_params)

    respond_to do |format|
      if @axiento.save
        format.html { redirect_to @axiento, notice: 'Axiento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @axiento }
      else
        format.html { render action: 'new' }
        format.json { render json: @axiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cb/axientos/1
  # PATCH/PUT /cb/axientos/1.json
  def update
    respond_to do |format|
      if @cb_axiento.update(cb_axiento_params)
        format.html { redirect_to @cb_axiento, notice: 'Axiento was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @cb_axiento }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cb_axiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cb/axientos/1
  # DELETE /cb/axientos/1.json
  def destroy
    @cb_axiento.destroy
    respond_to do |format|
      format.html { redirect_to cb_axientos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cb_axiento
      @cb_axiento = Cb::Axiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cb_axiento_params
      params.require(:cb_axiento).permit!#(:nombre, :proyecto_id, :proyecto)
    end
end
