module VerificaHelper
    def belongs_to_profissional(model)
        profissional_autenticado? && model.profissional == profissional_da_sessao
    end
end