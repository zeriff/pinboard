class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :upvote, :add_comment]
  before_action :authenticate_user!, except: [:index,:show]

  # AJAX DEMO
  before_action :all_pins
  respond_to :html, :js

  # GET /pins
  # GET /pins.json
  def index

  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = current_user.pins.build
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = current_user.pins.build(pin_params)
    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  def add_comment
    comment = @pin.comments.build(comment_params)
    comment.user = current_user;
    if comment.save
      redirect_to :back
    end

  end

  def get_info
    @pin = Pin.new
    @pin.pin_url = params[:pin_url];
    page = MetaInspector.new(@pin.pin_url)
    @pin.title = page.best_title
    @pin.description = page.meta['description']
    @pin.remote_image_url = page.meta['og:image']
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @pin }
    end
  end

  private

    def all_pins
      @pins = Pin.all.order('created_at DESC')
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      begin
        @pin = Pin.find(params[:id])
      rescue
        redirect_to :back
      end
    end

    def comment_params
      params.permit(:comment)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:title, :description, :image, :remote_image_url, :pin_url)
    end
end
