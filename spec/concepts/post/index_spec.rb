require 'spec_helper'

describe "Post" do
  describe "Index" do
    let! (:built_posts){ FactoryGirl.build_list(:post, 3) }

    let! (:created_posts) do
      built_posts.map do |built_post|
        Post::Create[ post: built_post.as_json ].model
      end
    end

    let! (:found_posts){ Post::Index.({}).model }

    it "finds the posts" do
      expect(found_posts).to eq(created_posts)
    end
  end
end
