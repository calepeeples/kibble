class CasesController < ApplicationController
  
  def index
    @case = Case.new
    @name = User.last
  end

  def new
    session[:case_params] ||= {}
    @case = Case.new(session[:case_params])
    @name = User.last
    @case.current_step = session[:case_step]
  end
  
  def create
    session[:case_params].deep_merge!(params[:case]) if params[:case]
    @case = Case.new(session[:case_params])
    @case.current_step = session[:case_step]
    if @case.valid?
      if params[:back_button]
        @case.previous_step
      elsif @case.last_step?
        @case.save if @case.all_valid?
      else
        @case.next_step
        flash[:notice] = "Case Progress Saved"
      end
      session[:case_step] = @case.current_step
    end
    if @case.new_record?
      render "new"
    else
      session[:case_step] = session[:case_params] = nil
      flash[:notice] = "Case Created"
      redirect_to "/cases/"
    end
  end

  def show
    @case = Case.find(params[:id])
    @name = User.last
  end
  
end
