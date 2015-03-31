class ProfissionalSession

    include ActiveModel::Validations
    include ActiveModel::Conversion

    extend ActiveModel::Naming
    extend ActiveModel::Translation

    attr_accessor :email, :password

    validates_presence_of :email, :password

    def initialize(session, attributes={})
        @session = session
        @email = attributes[:email]
        @password = attributes[:password]
    end

    def authenticate
    
        profissional = Profissional.authenticate(@email, @password)

        if profissional.present?
            grava_na_sessao(profissional)
        else
            errors.add(:base, :invalid_login)
            false
        end
    end

    def grava_na_sessao(profissional)
        @session[:profissional_id] = profissional.id
    end

    def persisted?
        false
    end

    # Métodos da sessão de profissional

    # retorna o profissional da sessão
    def profissional_da_sessao
        Profissional.find(@session[:profissional_id])
    end

    # profissional possui uma sessão autenticada?
    def profissional_autenticado?
        @session[:profissional_id].present?
    end

    def destroy
        @session[:profissional_id] = nil
    end

end