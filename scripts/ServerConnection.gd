extends Node


const KEY := "defaultkey"

var _client = Nakama.create_client(KEY, "localhost", 7350, "http")

func authenticate_async(email: String, password: String):
	var result = OK
	
	var new_session = await _client.authenticate_email_async(email, password, null, false)
	
	if not new_session.is_exception():
		EventBus.user_session = new_session
	else:
		result = FAILED
	
	return result

func register_async(email: String, password: String):
	var result = OK
	
	var new_session = await _client.authenticate_email_async(email, password, null, true)
	
	if not new_session.is_exception():
		EventBus.user_session = new_session
	else:
		result = FAILED
	
	return result
