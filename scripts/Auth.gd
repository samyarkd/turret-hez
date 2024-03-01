extends Control

@onready var server_connection = $ServerConnection

@onready var lg_email = $SignUpLogin/Login/Form/Email
@onready var lg_password = $SignUpLogin/Login/Form/Password
@onready var lg_btn = $SignUpLogin/Login/Form/Submit
@onready var lg_error = $SignUpLogin/Login/Form/Error

@onready var su_email = $SignUpLogin/Register/Form/Email
@onready var su_password = $SignUpLogin/Register/Form/Password
@onready var su_repeat_password = $SignUpLogin/Register/Form/RepeatPassword
@onready var su_btn = $SignUpLogin/Register/Form/Submit
@onready var su_error = $SignUpLogin/Register/Form/Error

func _process(delta):
	if server_connection._session:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func request_authentication():
	var email = lg_email.text
	var password = lg_password.text
	
	if len(email) == 0 or len(password) == 0:
		set_lg_error("You can't login homie enter some stuff and then try again")
		return
	
	var result = await server_connection.authenticate_async(email, password)
	
	if result == OK:
		set_lg_error('Yayyy %s you did it' % email)
		lg_email.text = ""
		lg_password.text = ""
	else: 
		set_lg_error("Lame bro %s is cooked" % email)

func request_registeration():
	var email = su_email.text
	var password = su_password.text
	var repeat_password = su_repeat_password.text
	
	if len(email) == 0 or len(password) == 0:
		set_su_error("You can't login homie enter some stuff and then try again")
		return
	
	if password != repeat_password:
		set_su_error("Passwords do not match")
		return
	
	var result = await server_connection.register_async(email, password)
	
	if result == OK:
		set_su_error('Yayyy %s you did it you made your user' % email)
		su_email.text = ""
		su_password.text = ""
		su_repeat_password.text = ""
	else: 
		set_su_error("Lame bro %s is cooked you could't even create a user" % email)

func _on_login_submit_pressed():
	lg_btn.disabled = true
	await request_authentication()
	lg_btn.disabled = false

func _on_register_submit_pressed():
	lg_btn.disabled = true
	await request_registeration()
	lg_btn.disabled = false

func set_lg_error(error: String):
	lg_error.text = error

func set_su_error(error: String):
	su_error.text = error
