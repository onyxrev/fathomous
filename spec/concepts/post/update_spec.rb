require 'spec_helper'

describe "Post" do
  describe "Update" do
    let (:built_post){ FactoryGirl.build(:post) }
    let (:post){ Post::Create[ post: built_post.as_json ].model }

    describe "with valid post data" do
      let (:new_built_post){ FactoryGirl.build(:post) }

      before :each do
        Post::Update[ id: post.id, post: new_built_post.as_json ].model
        post.reload
      end

      it "persists" do
        expect(post.title).to eq(new_built_post.title)
        expect(post.body).to eq(new_built_post.body)
      end
    end

    describe "with invalid post data" do
      let (:run){ Post::Update.run( id: post.id, post: { title: "", body: "" } ) }
      let (:result){ run.first }
      let (:operation){ run.last }

      it "persists" do
        expect(operation.errors.messages[:title].include?("can't be blank")).to be_true
        expect(operation.errors.messages[:body].include?("can't be blank")).to be_true
      end
    end
  end
end
