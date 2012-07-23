class RowsController < ApplicationController
  def index
    @tables = Table.all
#    @rows = Row.where([" table_id = ? ", 1])
  end

  def show
    @tables = Table.all    
    @columns = Column.all
    @rows = Row.all
  end

  def new
    @row = Row.new 
    @table_id = params[:tid].to_i
    @tables = Table.all    
    @columns = Column.all
    @rows = Row.all    
  end

  def create
    array_counter = Array.new(2, Hash.new)         
    array_counter[1..params[:column_count].to_i] = 1

    array_counter.each_with_index do |a, index|
      new_row = Row.new
      new_row.table_id = params[:table_id].to_i
      new_row.column_id = params["column_id" + index.to_s].to_i
      new_row.row_data = params["name" + index.to_s]
      new_row.save
    end
  end

  def edit
  end

  def update
  end
end
