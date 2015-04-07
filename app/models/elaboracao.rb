class Elaboracao < ActiveRecord::Base
  belongs_to :projeto
  belongs_to :empresa
  belongs_to :profissional
  attr_accessible :conclusao, :data_elaboracao, :recomendacoes

  validates_presence_of :projeto_id, :empresa_id, :profissional_id,
  :conclusao, :data_elaboracao, :recomendacoes
end