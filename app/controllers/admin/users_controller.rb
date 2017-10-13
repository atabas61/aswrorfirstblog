class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user_custom, only: [:new_password, :change_password]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @show_items = true
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_admin_user_url(@user), notice: 'Kullanıcı Oluşturuldu.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_admin_user_url(@user), notice: 'Kullanıcı Bilgileri Güncellendi.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'Kullanıcı Sistemden Silindi.' }
      format.json { head :no_content }
    end
  end
    
    
    
  def new_password
  end
    
  def change_password
      @post_password_data = params.require(:user).permit(:password, :repassword)
      password = @post_password_data[:password]
      repassword = @post_password_data[:repassword]
      
      if password.size<6
          flash[:alertclass] = "danger"
          redirect_to admin_user_new_password_path(params[:user_id]), notice: "Parolanız en az 6 karakterden oluşmalıdır lütfen tekrar deneyin."
      elsif !password.eql?(repassword)
          flash[:alertclass] = "danger"
          redirect_to admin_user_new_password_path(params[:user_id]), notice: "Parolalar eşit değil. Yeniden deneyin."
      else
          if @user.update(user_params)
            redirect_to admin_user_new_password_path(params[:user_id]), notice: "Parola Değiştirildi."
          else
            flash[:alertclass] = "danger"
            redirect_to admin_user_new_password_path(params[:user_id]), notice: "Bir sorun oluştu ve parola değişmedi."
          end
          
      end
  end
    
    
    
    
    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def set_user_custom
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :full_name, :email, :gender, :birthday, :status)
    end
end

