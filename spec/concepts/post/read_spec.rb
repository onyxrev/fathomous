require 'spec_helper'

describe "Post" do
  describe "Read" do
    let! (:built_post){ FactoryGirl.build(:post) }
    let! (:created_post){ Post::Create[ post: built_post.as_json ].model }
    let! (:found_post){ Post::Read.(id: created_post.id).model }

    it "finds the posts" do
      expect(found_post).to eq(created_post)
    end
  end
end
