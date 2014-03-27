class Cb::ProyectosController < ApplicationController
  before_action :set_cb_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /cb/proyectos
  # GET /cb/proyectos.json
  def index
    @cb_proyectos = Cb::Proyecto.all
  end

  # GET /cb/proyectos/1
  # GET /cb/proyectos/1.json
  def show
  end

  # GET /cb/proyectos/new
  def new
    @cb_proyecto = Cb::Proyecto.new
  end

  # GET /cb/proyectos/1/edit
  def edit
  end

  # POST /cb/proyectos
  # POST /cb/proyectos.json
  def create
    @cb_proyecto = Cb::Proyecto.new(cb_proyecto_params)

    respond_to do |format|
      if @cb_proyecto.save
        format.html { redirect_to @cb_proyecto, notice: 'Proyecto was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cb_proyecto }
      else
        format.html { render action: 'new' }
        format.json { render json: @cb_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cb/proyectos/1
  # PATCH/PUT /cb/proyectos/1.json
  def update
    respond_to do |format|
      if @cb_proyecto.update(cb_proyecto_params)
        format.html { redirect_to @cb_proyecto, notice: 'Proyecto was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @cb_proyecto }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cb_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cb/proyectos/1
  # DELETE /cb/proyectos/1.json
  def destroy
    @cb_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to cb_proyectos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cb_proyecto
      @cb_proyecto = Cb::Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cb_proyecto_params
      params.require(:cb_proyecto).permit(:name)
    end
end
