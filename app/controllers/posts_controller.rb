# coding: utf-8
class PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    run Post::Create do |op|
      return render json: op
    end
  end

  def show
    run Post::Read do |op|
      return render json: op
    end
  end

  def index
    collection Post::Index do |op|
      return render json: op
    end
  end

  def update
    run Post::Update do |op|
      return render json: op
    end
  end

  def destroy
    run Post::Destroy do |op|
      return render json: op
    end
  end
end
