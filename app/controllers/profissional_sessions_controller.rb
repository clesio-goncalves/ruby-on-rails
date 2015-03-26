class ProfissionalSessionsController < ApplicationController
    def new
        @session = ProfissionalSession.new(session)
    end

    def create
        @session = ProfissionalSession.new(session, params[:profissional_session])

        if @session.authenticate
            redirect_to root_path, :notice => '##'
        else
            render :new
        end
    end

    def destroy

    end
end