class ApplicationController < ActionController::Base

    helper_method :current_user, :is_logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def is_logged_in?
        !!current_user
    end

    def user_required
        if !is_logged_in?
            flash[:alert] = "You must log in first."
            redirect_to login_path
        end
    end

    def same_user_required
        if @article.present? && current_user != @article.user && !current_user.admin?
            flash[:notice] = "You cannot edit this article."
            redirect_to @article
        end

        if @user.present? && current_user != @user && !current_user.admin?
            flash[:notice] = "You cannot edit this user's profile."
            redirect_to @user
        end
    end

end
