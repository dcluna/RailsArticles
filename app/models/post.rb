# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  # Validations
  validates :title, :presence => true, :length => { :maximum => 255 }
  validates :body, :presence => true, :length => { :maximum => 8191 }
  validates :author, :presence => true, :length => { :maximum => 127 }
  validates :status, :numericality => { :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 3 }

  has_and_belongs_to_many :tags

  attr_accessible :title, :body, :author, :status, :pub_date, :tag_tokens # leave them open for mass-assign
  attr_reader :tag_tokens

  def tag_tokens=(ids) # tokenizer
    self.tag_ids = ids.split(",")
  end

  def published?
    status == 1 and pub_date <= Date.today
  end

  def tag_names #virtual attr
    tags.collect {|tag| tag.name}.join(' ')
  end
end
