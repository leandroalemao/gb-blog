class UsersController < Clearance::UsersController
  before_filter :handle_disabled_registration, only: [:new, :create]

  def show
    @user = User.from_param(params[:author])
  end

  def new
  end

  def create
  end

  private

  def handle_disabled_registration
    redirect_to sign_in_path, notice: t('flashes.registration_disabled')
  end
end
