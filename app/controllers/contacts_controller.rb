class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]
  before_action :ensure_current_user_is_owner, only: [:show, :destroy, :update, :edit]

  # GET /contacts or /contacts.json
  def index
    @q = current_user.contacts.ransack(params[:q])
    @contacts = @q.result
    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /contacts/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.owner_id = current_user.id
    respond_to do |format|
      if @contact.save
        format.html { redirect_back fallback_location: root_path, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_back fallback_location: root_path, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def ensure_current_user_is_owner
      if current_user != @contact.owner
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      end
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :image, :organization, :preferred_method, :personal_number, :work_number, :email, :instagram_url, :facebook_url, :owner_id, :picture)
    end
end
