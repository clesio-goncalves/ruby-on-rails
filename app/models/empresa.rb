class Empresa < ActiveRecord::Base
  attr_accessible :atividade_principal, :bairro, :cep, :cidade, 
  :cnae, :cnpj, :complemento, :email, :grau_risco, :inscricao_estadual, 
  :nome_empresarial, :nome_fantasia, :nome_logradouro, 
  :numero_logradouro, :telefone, :uf

  validates_presence_of :cnpj, :nome_empresarial, :grau_risco, :cnae, 
  :atividade_principal, :email, :cep, :nome_logradouro, :bairro, :uf, :cidade

  # Validação de tamanho
  validates_length_of :cnpj, :maximum => 18, :allow_blank => false
  validates_length_of :inscricao_estadual, :maximum => 12, :allow_blank => true
  validates_length_of :nome_empresarial, :nome_logradouro, :maximum => 100, :allow_blank => false
  validates_length_of :nome_fantasia, :maximum => 100, :allow_blank => true

  validates_length_of :grau_risco, :is => 1, :allow_blank => false
  validates_numericality_of :grau_risco, :only_integer => true, :allow_nil => false
  ######

  validates_length_of :cnae, :cep, :maximum => 10, :allow_blank => false
  validates_length_of :atividade_principal, :minimum => 10, :allow_blank => false
  validates_length_of :telefone, :maximum => 13, :allow_blank => true
  validates_length_of :email, :bairro, :cidade, :maximum => 50, :allow_blank => false

  validates_numericality_of :numero_logradouro, :only_integer => true, :allow_nil => true

  validates_length_of :uf, :is => 2, :allow_blank => false
  validates_length_of :complemento, :maximum => 50, :allow_blank => true

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates_uniqueness_of :cnpj, :email
end
