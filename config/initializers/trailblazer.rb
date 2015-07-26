require "roar/json"
require 'trailblazer/autoloading'

::Roar::Representer.module_eval do
  include Rails.application.routes.url_helpers
  # include Rails.app.routes.mounted_helpers

  def default_url_options
    {}
  end
end
# end

Trailblazer::Operation::CRUD.module_eval do
  module Included
    def included(base)
      super # the original CRUD::included method.
      base.send :include, Trailblazer::Operation::CRUD::ActiveModel
    end
  end
  extend Included # override CRUD::included.
end
