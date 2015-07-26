require 'spec_helper'

describe "Post" do
  describe "Destroy" do
    let! (:built_post){ FactoryGirl.build(:post) }
    let! (:post){ Post::Create[ post: built_post.as_json ].model }
    let! (:run){ Post::Destroy.run(id: post.id, post: built_post.as_json) }
    let! (:result){ run.first }
    let! (:operation){ run.last }

    it "deletes" do
      expect(result).to be_true
      expect(operation.model).to eq(post)

      expect{ post.reload }.to raise_exception ActiveRecord::RecordNotFound
    end
  end
end
