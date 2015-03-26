class ProfissionalSession

    def initialize(session, attributes={})
        @session = session
        @email = attributes[:email]
        @senha = attributes[:senha]
    end

    include ActiveModel::Validations
    include ActiveModel::Conversion

    include ActiveModel::Naming
    include ActiveModel::Translation

    attr_accessor :email, :senha

    def persisted?
        false
    end

end