class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.xml
  def index

    @entries = Entry.find(:all, :include => :transactions)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
      max_length = get_max_transaction_length
      entry_strings = @entries.map do |entry|
        entry.render_text max_length
      end.reduce { |x, y| x + "\n" + y}
      format.text { render :text => entry_strings }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = Entry.new
    2.times { @entry.transactions.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    logger.info "Creating Entry"
    @entry = Entry.new(params[:entry])
    logger.info "Entry Created"

    respond_to do |format|
      if @entry.save
        format.html { redirect_to(@entry, :notice => 'Entry was successfully created.') }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry, :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end

  def upload
    uploaded_io = params[:file]
    LedgerParser.parse uploaded_io
    redirect_to(entries_path)
  end
  
  private
  def get_max_transaction_length
    @transactions = Transaction.all
    max_length = 0
    @transactions.each do |transaction|
      max_length = transaction.account.length if transaction.account.length > max_length
    end
    max_length += 4
  end
  
end
