$(document).ready(function() {
$('.arrow').click(function(){
  // console.log($(this).data('arrow'));
  // console.log($(this).data('postid'));
  var clickedObj = $(this);
  console.log(clickedObj);
  var voteData = {upvote: $(this).data('arrow'),
              post_id: $(this).data('postid')
            };
   $.ajax({
    url: "/post/vote",
    type: "post",
    data: voteData
   }).done(function(){
    // console.log($(this));
    console.log(clickedObj);
    clickedObj.hide('fast');
    clickedObj.siblings().show();

    // $('.arrow').hide();
   });
  }
);

$('.arrow_comment').click(function(){
  // console.log($(this).data('arrow'));
  // console.log($(this).data('postid'));
  var commentVoteData = {upvote: $(this).data('arrow'),
              comment_id: $(this).data('commentid')
            };
    console.log(commentVoteData);
   $.ajax({
    url: "/comment/vote",
    type: "post",
    data: commentVoteData
   }).success(function(){
   });
  }
);
});
// $('a').on('click', function(even){ $(this).data('post-id')})

// $('.arrow').click(function(){
//   console.log($(this).data('arrow'));
// })