class RowsController < ApplicationController
  def index
    @rows = Row.where([" table_id = ? ", 1])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
