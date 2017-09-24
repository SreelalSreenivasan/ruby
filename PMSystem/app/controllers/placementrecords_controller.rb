class PlacementrecordsController < ApplicationController

def create
    @p = Record.new
    @p.year= params[:year]
    @p.company= params[:company]
    @p.offers= params[:offers]
    @p.save
    redirect_to new_placementrecord_path

  end

  def show1
    @p = Record.new
    @p = Record.all
  end
  def show2
    @p = Record.new
    @p = Record.all
  end
  def show3
    @p = Record.new
    @p = Record.all
  end
end
