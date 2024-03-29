class QuotesController < ApplicationController
  # GET /quotes
  # GET /quotes.json
  before_filter :require_login, :only => [:new, :edit, :destroy]

  respond_to :html

  def index
    @tag = nil
    if params[:tag].present?
      @tag = Tag.find(params[:tag])
      @quotes = @tag.quotes
    elsif params[:book].present?
      @quotes = Book.find(params[:book]).quotes
    else
      @quotes = Quote.limit(10).order('created_at DESC')
    end

    # @quotes = @quotes.reject { |quote| quote.user!=current_user  }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotes }
    end
  end

  def admin
    @quotes = Quote.all
    respond_with(@quotes)
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.json
  def new
    @quote = Quote.new
    3.times {@quote.tags.build}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.json

  def create
    @quote = Quote.new(params[:quote])
    @quote.user = current_user

    respond_to do |format|
      if @quote.save
        format.html { redirect_to :root, notice: 'Quote was successfully created.' }
        format.json { render json: @quote, status: :created, location: @quote }
      else
        format.html { render action: "new" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.json
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :ok }
    end
  end
end
