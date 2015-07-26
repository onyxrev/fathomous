# coding: utf-8
class PostCrudTest < MiniTest::Spec
  describe "Create" do
    it "persists valid" do
      thing = Post::Create[
        post: {title: "Rails", body: "Kickass web dev"}
      ].model

      thing.persisted?.must_equal true
      thing.title.must_equal "Rails"
      thing.body.must_equal "Kickass web dev"
    end
  end
end
