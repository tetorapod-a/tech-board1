json.text  @comment.content
json.user_id  @comment.user.id
json.user_name  @comment.user.name
json.time @comment.created_at.strftime("%m/%d %H:%M")
json.image @comment.image_url