class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :ensure_current_user_is_owner, only: [:show, :destroy, :update, :edit]


  # GET /groups or /groups.json
  def index
    @groups = Group.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /groups/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    @group.owner = current_user

    respond_to do |format|
      if @group.save
        format.html { redirect_back fallback_location: root_path, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_back fallback_location: root_path, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    def ensure_current_user_is_owner
      if current_user != @group.owner
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      end
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :description, :notes, :members_count, :owner_id)
    end
end
