# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  # Validations
  validates :title, :presence => true, :length => { :maximum => 255 }
  validates :body, :presence => true, :length => { :maximum => 8191 }
  validates :author, :presence => true, :length => { :maximum => 127 }

  # Status enumeration
  as_enum :status, { :published => 1, :in_revision => 2, :draft => 3 }, :column => 'status_id' # statuses have these values for backwards compatibility

  has_and_belongs_to_many :tags

  attr_accessible :title, :body, :author, :status, :pub_date, :tag_tokens # leave them open for mass-assign
  attr_reader :tag_tokens

  paginates_per 10 # posts per page

  def tag_tokens=(ids) # tokenizer
    self.tag_ids = ids.split(",")
  end

  def available?
    self.published? && (!pub_date || pub_date <= Date.today)
  end

  def tag_names # virtual attr to 'store' tag names
    tags.collect(&:name).join(',') # pass symbol as Proc to 'collect'
  end
end
