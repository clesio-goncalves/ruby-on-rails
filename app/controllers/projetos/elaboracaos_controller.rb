class Projetos::ElaboracaosController < ApplicationController
    before_filter :requer_autenticacao

    def new
        @elaboracao = Elaboracao.new
    end

    def create

    end

    def edit

    end

    def update

    end
end