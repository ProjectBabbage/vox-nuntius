extends Control

const SERVER_PORT = 12345
const MAX_PLAYERS = 2

var game: Game

func _ready():
	$IP_LIST.text = get_ips().join("\n")
	game = get_parent()
	if OS.get_cmdline_args().size() > 0:
		var arg = OS.get_cmdline_args()[0]
		print(arg)
		if arg == "listen":
			_on_Server_pressed()
		elif arg == "join":
			yield(get_tree().create_timer(1.0), "timeout")
			_on_Client_pressed()


func create_server():
	game.role = "server"
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer
	print("Server created")


func connect_to_server():
	game.role = "client"
	var ip = $IP.text
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip, SERVER_PORT)
	get_tree().network_peer = peer


func get_ips():
	var ips: PoolStringArray = []
	for ip in IP.get_local_addresses():
		if ip.find("192") != -1:
			ips.append(ip)
	return ips


func _on_Client_pressed():
	connect_to_server()
	get_tree().connect("network_peer_connected", self, "_player_connected")
	visible = false

func _on_Server_pressed():
	create_server()
	get_tree().connect("network_peer_connected", self, "_player_connected")
	visible = false

func _player_connected(id):
	rpc_id(id, "register")

remote func register():
	var id = get_tree().get_rpc_sender_id()
	var my_id = get_tree().get_network_unique_id()
	game.my_player_id = my_id
	print("registering players ", id, " " , my_id)
	if game.role == "server":
		game.init_player_1(id)
		game.init_player_2(my_id)
	elif game.role == "client":
		game.init_player_1(my_id)
		game.init_player_2(id)
	else:
		print("Error: unknown role")
	
	game.switch_to_game()
