class ApplicationController < ActionController::Base
    delegate :current_profissional, :profissional_signed_in?, :to => :profissional_session
    helper_method :current_profissional, :profissional_signed_in?
    
    protect_from_forgery

    def profissional_session
        ProfissionalSession.new(session)
    end

    def require_authentication
        unless profissional_signed_in?
            redirect_to new_profissional_sessions_path,
            :alert => 'Para continuar, você precisa estar logado!'
        end
    end

    def require_no_authentication
        redirect_to root_path if profissional_signed_in?
    end
end
