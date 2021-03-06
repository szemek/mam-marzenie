#
class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy]

  # GET /dreams
  # GET /dreams.json
  def index
    query = params[:q]
    date = query.try(:[], :updated_at)
    @search = Dream.search(query.try(:except, :updated_at))

    if date.blank?
      @dreams = @search.result
    else
      @dreams = @search.result.updated_after(date)
    end
  end

  # GET /dreams/1
  # GET /dreams/1.json
  def show
    @task = Task.new
    @member = @dream.members.find_by(user_id: current_user.id)
    @users = @dream.users
    @comments = @dream.comments.order('created_at DESC').joins(:user)
  end

  # GET /dreams/new
  def new
    @dream = Dream.new
  end

  # GET /dreams/1/edit
  def edit
  end

  # POST /dreams
  # POST /dreams.json
  def create
    @dream = Dream.new(dream_params)

    respond_to do |format|
      if @dream.save
        format.html { redirect_to @dream, notice: 'Dream was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dream }
      else
        format.html { render action: 'new' }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dreams/1
  # PATCH/PUT /dreams/1.json
  def update
    respond_to do |format|
      if @dream.update(dream_params)
        format.html { redirect_to @dream, notice: 'Dream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
    @dream.destroy
    respond_to do |format|
      format.html { redirect_to dreams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dream
      @dream = Dream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dream_params
      params.require(:dream).permit(
        :title,
        :description,
        :child_fullname,
        :child_age,
        :avatar,
        :region,
        :category,
        :status,
        :step
      )
    end
end
