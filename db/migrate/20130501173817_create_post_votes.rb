class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.references :post
      t.boolean :upvote
    end
  end
end
