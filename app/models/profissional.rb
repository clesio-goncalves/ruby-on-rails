class Profissional < ActiveRecord::Base
  attr_accessible   :email, :especialidade, :nome, :registro, :password, 
                    :telefone, :password_confirmation

  validates_presence_of :email, :especialidade, :nome, :registro, :password, :password_confirmation

  #Validação de tamanho
  validates_length_of :nome, :maximum => 100, :allow_blank => false
  validates_length_of :email, :especialidade, :registro, :password, :maximum => 50, :allow_blank => false
  validates_length_of :telefone, :maximum => 13, :allow_blank => true

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of :email, :registro

  has_secure_password

end