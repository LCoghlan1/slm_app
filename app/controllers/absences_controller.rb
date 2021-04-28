class AbsencesController < ApplicationController
  before_action :set_absence, only: %i[ show update destroy ]

  # GET /absences or /absences.json
  def index
    #ransack search
    @q = Absence.ransack(params[:q])
    #paginate
    @pagy, @absences = pagy(@q.result)
    #define for charkick
    @absence_type = [
        ['Full Pay', @absences.sum(:full_pay)],
        ['Half Pay', @absences.sum(:half_pay)]
      ]
    #attempt to upload/download cvs format - in development
    respond_to do |format|
      format.html
      format.csv { render text: @absences.to_csv }
    end

  end
  
  #for carrierwave image view
  def image

  end
  
  # GET /absences/1 or /absences/1.json
  def show
    
  end
  

  
  # GET /absences/new
  def new
    @employee = Employee.find(params[:employee_id])
    @absence = Absence.new(employee_id: params[:employee_id])
  end

  # GET /absences/1/edit
  def edit
    @absence = Absence.find(params[:employee_id])
    @employee = Employee.find(params[:id])
  end

  # POST /absences or /absences.json
# Controller
  def create
    @absence = Absence.new(absence_params)
  
    respond_to do |format|
      if @absence.save
        format.html { redirect_to employee_url(@absence.employee_id), :controller => :employees, notice: "Absence was successfully created." }
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
        format.html { redirect_to employee_url(@absence.employee_id), :controller => :employees, notice: "Absence was successfully updated." }
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
      format.html { redirect_to employee_url(@absence.employee_id), notice: "Absence was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def import
    Absence.import(params[:file])
    redirect_to absences_path, notice: "Absence(s) added successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absence
      @absence = Absence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def absence_params
      params.require(:absence).permit(:remove_image, :image, :instance_no, :date, :end_date, :full_pay, :half_pay, :description, :employee_id)
    end
end
