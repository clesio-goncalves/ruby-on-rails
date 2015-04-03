class ProfissionalsController < ApplicationController

    before_filter :nao_requer_autenticacao, :only => [:new, :create]
    before_filter :pode_alterar, :only => [:edit, :update]

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

    # Não permite a vizualização e edição do perfil dos outros profissionais

    private 

    def pode_alterar
        unless profissional_autenticado? && profissional_da_sessao == profissional
            redirect_to Profissional.find(params[:id]),
            :alert => 'Não é pertida a edição do perfil alheio!'
        end
    end

    def profissional
        @profissional ||= Profissional.find(params[:id])
    end

end