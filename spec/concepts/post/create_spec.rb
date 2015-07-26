require 'spec_helper'

describe "Post" do
  describe "Create" do
    describe "with valid post data" do
      let (:built_post){ FactoryGirl.build(:post) }
      let (:post){ Post::Create[ post: built_post.as_json ].model }

      it "persists" do
        expect(post.persisted?).to be_true
        expect(post.title).to eq(built_post.title)
        expect(post.body).to eq(built_post.body)
      end
    end

    describe "with invalid post data" do
      let (:run){ Post::Create.run(post: { title: "", body: "" }) }
      let (:result){ run.first }
      let (:operation){ run.last }

      it "persists" do
        expect(result).to be_false
        expect(operation.errors.messages[:title].include?("can't be blank")).to be_true
        expect(operation.errors.messages[:body].include?("can't be blank")).to be_true
      end
    end
  end
end
