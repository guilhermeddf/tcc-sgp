class UserAbilitiesController < ApplicationController
  before_action :set_user_ability, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /user_abilities
  # GET /user_abilities.json
  def index
    @user_abilities = UserAbility.where user: @user
  end

  # GET /user_abilities/1
  # GET /user_abilities/1.json
  def show
  end

  # GET /user_abilities/new
  def new
    @user_ability = UserAbility.new
  end

  # GET /user_abilities/1/edit
  def edit
  end

  # POST /user_abilities
  # POST /user_abilities.json
  def create
    @user_ability = UserAbility.new(user_ability_params)
    @user_ability.user = @user
    respond_to do |format|
      if @user_ability.save
        format.html { redirect_to @user_ability, notice: 'Habilidade adicionada para o usuário.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /user_abilities/1
  # PATCH/PUT /user_abilities/1.json
  def update
    respond_to do |format|
      if @user_ability.update(user_ability_params)
        format.html { redirect_to @user_ability, notice: 'Habilidade atualizada para o usuário.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /user_abilities/1
  # DELETE /user_abilities/1.json
  def destroy
    @user_ability.destroy
    respond_to do |format|
      format.html { redirect_to user_abilities_url, notice: 'Habilidade deletada do usuário.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_ability
      @user_ability = UserAbility.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_ability_params
      params.require(:user_ability).permit(:user_id, :ability_id)
    end
end
