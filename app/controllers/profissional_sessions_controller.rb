class ProfissionalSessionsController < ApplicationController

    before_filter :nao_requer_autenticacao, :only => [:new, :create]
    before_filter :requer_autenticacao, :only => [:destroy]
    
    def new
        @session = ProfissionalSession.new(session)
    end

    def create
        @session = ProfissionalSession.new(session, params[:profissional_session])

        
        if @session.authenticate
            redirect_to root_path, :notice => 'Login efetuado com sucesso!'
        else
            render :new
        end
    end

    def destroy
        profissional_session.destroy
        redirect_to root_path, :notice => 'Logout efetuado com sucesso!'
    end
end