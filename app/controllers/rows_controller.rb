class RowsController < ApplicationController

  before_filter :check_permissions, :only => [:new, :create, :cancel] # => :new, :create, 
  skip_before_filter :require_no_authentication

  def check_permissions
    @row = Row.new
    authorize!  :create, @row # resource
# load_and_authorize_resource    
  end

  def index
    @tables = Table.all
  end

  def show
    @tables = Table.where([" id = ? ", params[:tid].to_i])
    @columns = Column.where([" table_id = ? ", params[:tid].to_i])
    @rows = Row.where([" table_id = ? ",  params[:tid].to_i])
  end

  def new
    @row = Row.new 
    @table_id = params[:tid].to_i
    @tables = Table.where([" id = ? ", params[:tid].to_i])
    @columns = Column.where([" table_id = ? ", params[:tid].to_i])
    @rows = Row.where([" table_id = ? ",  params[:tid].to_i])    
  end

  def create
    array_counter = Array.new(2, Hash.new)         
    array_counter[0..params[:column_count].to_i] = 1

    array_counter.each_with_index do |a, index|
      new_row = Row.new
      new_row.table_id = params[:table_id].to_i
      new_row.column_id = params["column_id" + index.to_s].to_i
      new_row.row_data = params["name" + index.to_s]
      new_row.save
    end
    redirect_to rows_path    
  end

  def edit
  end

  def update
  end
end
