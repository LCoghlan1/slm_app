class HomeController < ApplicationController
  def index
    @employees = Employee.all
    @absences = Absence.all
    @pagy, @messages = pagy(Message.all.order('created_at DESC'), items: 5)
    @documents = Document.all
  end
end
