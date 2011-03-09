class Admin::CollectionsController < ApplicationController

  layout "admin"
  
  def index
    @collections = Collection.all
    
    @title = controller_name.humanize
    @klass = controller_name
    
    # get all columns
    @columns = Collection.column_names    
    # remove unnecessary
    @columns -= ["id", "created_at", "updated_at"]
    # humanize column names for display
    @column_names = @columns.map {|c| c.humanize}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collections }
    end
  end

  
  def show
    @collection = Collection.find(params[:id])
    
    @columns = Collection.column_names
    @column_names = @columns.map {|c| c.humanize}

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collection }
    end
  end

  
  def new
    @collection = Collection.new    
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collection }
    end
  end


  def edit
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.new(params[:collection])

    respond_to do |format|
      if @collection.save
        format.html { redirect_to([:admin, @collection], :notice => 'Collection was successfully created.') }
        format.xml  { render :xml => @collection, :status => :created, :location => @collection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to([:admin, @collection], :notice => 'Collection was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to(admin_collections_url) }
      format.xml  { head :ok }
    end
  end

end
