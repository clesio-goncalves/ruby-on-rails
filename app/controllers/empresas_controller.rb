class EmpresasController < ApplicationController

    before_filter :requer_autenticacao, 
    :only => [:new, :create, :edit, :update, :destroy]

    def index
        @empresa = Empresa.all
    end

    def new
        @empresa = Empresa.new
    end

    def create
        @empresa = Empresa.new(params[:empresa])

        if @empresa.save
            redirect_to @empresa, :notice => 'Empresa criada com sucesso!'
        else
            render :new
        end
    end

    def show
        @empresa = Empresa.find(params[:id])
    end

    def edit
        @empresa = Empresa.find(params[:id])
    end

    def update
        @empresa = Empresa.find(params[:id])

        if @empresa.update_attributes(params[:empresa])
            redirect_to @empresa, :notice => 'Empresa atualizada com sucesso!'
        else
            render :edit
        end
    end

    def destroy
        @empresa = Empresa.find(params[:id])
        @empresa.destroy

        redirect_to empresas_url
    end

end