class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers, :lista, :new_plaza, :plazas, :following_plaza, :show, :update_administrative,]
  before_action :correct_user,   only: [:edit, :update, :update_administrative]
  before_action :admin_user,     only: :destroy

  require 'open-uri'

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
    @users = if params[:tern]
      User.where('name @@ :t or description @@ :t', t: params[:tern]).order('created_at DESC').paginate(page: params[:page])
    else
      User.where(activated: true).paginate(page: params[:page])
    end
  end

  def plazas
    @users = User.where(plaza: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @microposts = Micropost.where(:user_id => @user.id).paginate(page: params[:page], per_page: 10)
    @peticiones = Micropost.where(:user_id => @user.id).where(:petition => true)
    @peticiones_all = Micropost.where(:petition => true)
    @plazas_grupos = Group.where(:user_id => @user.id)
    # De acciones / causas / consultas _short
    @grupos_acciones = Group.where(user_id: @user)
    
    if @microposts.empty?
      @microposts = Micropost.where(:plaza_id => @user.id).paginate(page: params[:page], per_page: 10)
    else 
    end
    @comment = Comment.new( :micropost => @micropost )
    @micropost  = current_user.microposts.build 

  end

  def lista
    # Usuario que solo son de la ciudad del user
    users_ciudad = ("SELECT id FROM users
                    WHERE ciudad = :ciudad")

    @candidatos_pueblo = User.find_by_sql(
      'SELECT     users.id,
      COUNT       (relationships.followed_id)
      AS          numbersOfFollowers
      FROM        relationships
      LEFT JOIN   users
      ON          relationships.followed_id = users.id
      GROUP BY    users.id
      ORDER BY    count(followed_id) 
      DESC
      ') 
    @candidatos_autonomia = User.find_by_sql(
      'SELECT     users.id,
      COUNT       (relationships.followed_id)
      AS          numbersOfFollowers
      FROM        relationships
      LEFT JOIN   users
      ON          relationships.followed_id = users.id
      GROUP BY    users.id
      ORDER BY    count(followed_id) 
      DESC
      ')
    @candidatos_mundo = User.find_by_sql(
      'SELECT     users.id,
      COUNT       (relationships.followed_id)
      AS          numbersOfFollowers
      FROM        relationships
      LEFT JOIN   users
      ON          relationships.followed_id = users.id
      GROUP BY    users.id
      ORDER BY    count(followed_id) 
      DESC
      ')
  end

  def new
    @user = User.new
  end

  def new_plaza
    @plaza = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to  :back #root_url 
    else
      render 'new'
    end
  end

  def create_plaza
    @user = User.new(plaza_params)
    if @user.save
      flash[:info] = "Added new plaza!!"
      redirect_to  '/plazas' 
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def edit_administrative
    @user = User.find(params[:id])
  end

  def update_administrative
    @user = User.find(params[:id])
    if @user.update_attributes(autonomia: params[:autonomia], provincia: params[:provincia], ciudad: params[:ciudad])
      respond_to do |format|
        format.html { 
          redirect_back fallback_location: root_url 
        }
        format.js
      end
    else
    end
  end

  def update_administrative_ciudad
    @user = User.find(params[:id])
    if @user.update_attributes(ciudad: params[:ciudad], provincia: params[:provincia])
      respond_to do |format|
        format.html { 
          redirect_back fallback_location: root_url 
        }
        format.js
      end
    else
    end
  end

  def update_circles_administrative
    @user = User.find(params[:id])
    if @user.update_attributes(ciudad: params[:ciudad])
      flash[:success] = "Círculos actualizados!"
      redirect_to root_url
    else
      redirect_back fallback_location: root_url
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to edit
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'following'
  end

  def following_plaza
    @user = current_user
    @title = "Your Plazas"
    @users = @user.following.where(:plaza => true).paginate(page: params[:page])
    render 'following'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :ciudad, :autonomia, :profesion, :foto, :created_by, :plaza, :linkedin, :description, :provincia, :pais, :tern, :candidate)
    end

    def plaza_params
      params.require(:user).permit(:activated, :name, :email, :password,
                                   :password_confirmation, :ciudad, :autonomia,:profesion, :foto, :created_by, :plaza)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
