class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.references :comment
      t.boolean :upvote
    end
  end
end
