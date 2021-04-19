class HomeController < ApplicationController
  def index
    @employees = Employee.all
    @absences = Absence.all
    @pagy, @messages = pagy(Message.all, items: 5)
  end
end
