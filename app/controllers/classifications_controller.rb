class ClassificationsController < ApplicationController
  # GET /classifications
  # GET /classifications.json
  def index
    @classifications = Classification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classifications }
    end
  end

  # GET /classifications/1
  # GET /classifications/1.json
  def show
    @classification = Classification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classification }
    end
  end

  # GET /classifications/new
  # GET /classifications/new.json
  def new
    @classification = Classification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classification }
    end
  end

  # GET /classifications/1/edit
  def edit
    @classification = Classification.find(params[:id])
  end

  # POST /classifications
  # POST /classifications.json
  def create
    @classification = Classification.new(params[:classification])

    respond_to do |format|
      if @classification.save
        format.html { redirect_to @classification, notice: 'Classification was successfully created.' }
        format.json { render json: @classification, status: :created, location: @classification }
      else
        format.html { render action: "new" }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classifications/1
  # PUT /classifications/1.json
  def update
    @classification = Classification.find(params[:id])

    respond_to do |format|
      if @classification.update_attributes(params[:classification])
        format.html { redirect_to @classification, notice: 'Classification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifications/1
  # DELETE /classifications/1.json
  def destroy
    @classification = Classification.find(params[:id])
    @classification.destroy

    respond_to do |format|
      format.html { redirect_to classifications_url }
      format.json { head :no_content }
    end
  end
end
