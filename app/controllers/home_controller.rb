class HomeController < ApplicationController
  def index
    @employees = Employee.all
    @absences = Absence.all
  end
end
