class AbsencesController < ApplicationController
  before_action :set_absence, only: %i[ show edit update destroy ]

  # GET /absences or /absences.json
  def index
    @absences = Absence.all
  end

  # GET /absences/1 or /absences/1.json
  def show
  end

  # GET /absences/new
  def new
    @employee = Employee.find(params[:id])
    @absence = @employee.absences.build
  end

  # GET /absences/1/edit
  def edit
  end

  # POST /absences or /absences.json
  def create
    @absence = Absence.new(absence_params)

    respond_to do |format|
      if @absence.save
        format.html { redirect_to @absence, notice: "Absence was successfully created." }
        format.json { render :show, status: :created, location: @absence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /absences/1 or /absences/1.json
  def update
    respond_to do |format|
      if @absence.update(absence_params)
        format.html { redirect_to @absence, notice: "Absence was successfully updated." }
        format.json { render :show, status: :ok, location: @absence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absences/1 or /absences/1.json
  def destroy
    @absence.destroy
    respond_to do |format|
      format.html { redirect_to absences_url, notice: "Absence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absence
      @absence = Absence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def absence_params
      params.require(:absence).permit(:date, :full_pay, :half_pay, :description)
    end
end
