class ApplicationController < ActionController::Base
    delegate :profissional_da_sessao, :profissional_autenticado?, :to => :profissional_session
    helper_method :profissional_da_sessao, :profissional_autenticado?
    
    protect_from_forgery

    def profissional_session
        ProfissionalSession.new(session)
    end

    def requer_autenticacao
        unless profissional_autenticado?
            redirect_to new_profissional_sessions_path,
            :alert => 'Para continuar, você precisa estar logado!'
        end
    end

    def nao_requer_autenticacao
        if profissional_autenticado?
            redirect_to root_path, 
            :alert => 'Para continuar, você não pode estar logado!'
        end        
    end
end
