class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    @member.group_id =  params[:group_id]
    @contact_options = current_user.contacts.map{ |c| [ c.name, c.id ] }
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
   

    respond_to do |format|
      if @member.save
        format.html { redirect_back fallback_location: root_path, notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
        format.js
      else
        format.html { redirect_back fallback_location: root_path, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_back fallback_location: root_path, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { redirect_back fallback_location: root_path, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def remove

    @group =  Group.find(params[:group_id])
    @members = @group.members
  
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    
    @member.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:group_id, :contact_id)
    end
end
