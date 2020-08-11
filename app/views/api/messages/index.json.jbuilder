json.array! @messages do |message|
	json.content         message.content
	json.image           message.image.to_s
	json.date            message.created_at.strftime("%Y/%m/%d(%a) %H:%M")
	json.user_name       message.user.name
	json.id              message.id
	json.user_id         message.user.id
	json.current_user_id @current_user
end
