class ReportsController < ApplicationController
  def index
    @reports = Report.order("created_at asc").all
  end

  def show
    @report = Report.find(params[:id])
  end
  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(params[:report])
    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @report = Report.find(params[:id])
    if @report.update_attributes(params[:report])
      redirect_to @report, notice: 'Report was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_url
  end
end
