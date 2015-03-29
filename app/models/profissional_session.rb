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
            store(profissional)
        else
            errors.add(:base, :invalid_login)
            false
        end
    end

    def store(profissional)
        @session[:profissional_id] = profissional.id
    end

    def persisted?
        false
    end

end