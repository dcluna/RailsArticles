# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  validates :title, :presence => true, :length => { :maximum => 255 }
  validates :body, :presence => true, :length => { :maximum => 8191 }
  validates :author, :presence => true, :length => { :maximum => 127 }
  validates :status, :inclusion => { :in => [:Publicada, :"Em Revisão", :Rascunho] }
end
