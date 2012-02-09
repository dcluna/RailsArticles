# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  allowed_statuses = ['Publicada', "Em Revisão", 'Rascunho']
  validates :title, :presence => true, :length => { :maximum => 255 }
  validates :body, :presence => true, :length => { :maximum => 8191 }
  validates :author, :presence => true, :length => { :maximum => 127 }
  validates :status, :inclusion => { :in => allowed_statuses, :message => "deve ser um dos seguintes: #{allowed_statuses.to_s}" }

  has_many :tags
end
