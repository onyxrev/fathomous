require 'trailblazer/operation/representer'
require 'roar/decorator'
require 'roar/json/hal'

module PostRepresenterConcern
  include Roar::JSON::HAL

  link(:self) { post_path(represented.id) }
end

class PostRepresenter < Roar::Decorator
  include PostRepresenterConcern
end

class Post < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include CRUD
    include Representer

    model Post

    contract do
      property :title
      property :body

      validates :title, presence: true
      validates :body,  presence: true
    end

    representer do
      include PostRepresenterConcern
    end

    def process(params)
      validate(params[:post].to_json) do |f|
        f.save
      end
    end
  end

  class Update < Create
    def process(params)
      @model = find_model(params)

      validate(params[:post].to_json) do |f|
        f.save
      end
    end
  end

  class Destroy < Create
    def process(params)
      @model = find_model(params)
      @model.destroy
    end
  end

  class Index < Trailblazer::Operation
    include CRUD
    include Representer

    model Post

    representer do
      include Roar::JSON::HAL

      collection :model, extend: PostRepresenter, as: :posts
    end

    def model!(params)
      Post.all
    end

    def process(params)
      @model = model!(params)
    end
  end
end
