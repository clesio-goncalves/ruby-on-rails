class ProfissionalsController < ApplicationController

    def new
        @profissional = Profissional.new
    end

    def create
        @profissional = Profissional.new(params[:profissional])

        if @profissional.save
            redirect_to @profissional, :notice => 'Profissional criado com sucesso!'
        else
            render :new
        end
    end

    def show
        @profissional = Profissional.find(params[:id])
    end

    def edit
        @profissional = Profissional.find(params[:id])
    end

    def update
        @profissional = Profissional.find(params[:id])

        if @profissional.update_attributes(params[:profissional])
            redirect_to @profissional, :notice => 'Profissional atualizado com sucesso!'
        else
            render :edit
        end
    end
end