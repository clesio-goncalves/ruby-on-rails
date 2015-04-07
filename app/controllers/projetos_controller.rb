class ProjetosController < ApplicationController

    before_filter :requer_autenticacao, 
    :only => [:new, :create, :edit, :update, :destroy]

    def index
        @projetos = Projeto.all
    end

    def new
        @projeto = profissional_da_sessao.projetos.build
    end

    def create
        @projeto = profissional_da_sessao.projetos.build(params[:projeto])

        if @projeto.save
            redirect_to @projeto, :notice => 'Projeto criado com sucesso!'
        else
            render :new
        end
    end

    def show
        @projeto = Projeto.find(params[:id])
    end

    def edit
        @projeto = profissional_da_sessao.projetos.find(params[:id])
    end

    def update
        @projeto = profissional_da_sessao.projetos.find(params[:id])

        if @projeto.update_attributes(params[:projeto])
            redirect_to @projeto, :notice => 'Projeto atualizado com sucesso!'
        else
            render :edit
        end
    end


    def destroy
        @projeto = profissional_da_sessao.projetos.find(params[:id])
        @projeto.destroy

        redirect_to projetos_url
    end
    
end