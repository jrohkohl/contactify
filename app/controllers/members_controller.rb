class MembersController < ApplicationController
  before_action :set_member, only: %i[ destroy ]
  before_action :ensure_current_user_is_owner, only: [:destroy]

  # GET /members/new
  def new
    @member = Member.new
    @member.group_id =  params[:group_id]
    @contact_options = current_user.contacts.map{ |c| [ c.name, c.id ] }
    @group_options = current_user.groups.map{ |g| [ g.name, g.id ] }
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
   

    respond_to do |format|
      if @member.save
        format.html { redirect_to groups_path, notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
        format.js
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

    def ensure_current_user_is_owner
      if current_user != @member.group.owner
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      end
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:group_id, :contact_id)
    end
end
