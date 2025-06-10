extends Camera2D

# Referencia al nodo que queremos que la cámara siga (por ejemplo, el jugador).
var target: Node

func _ready():
	# Inicializa el nodo que quieres que la cámara siga (ajusta esto según tu escena).
	target = get_node("game/player")  # Cambia esta ruta por la de tu jugador.

func _process(delta):
	if target:
		# Solo seguimos al jugador en el eje Y
		position.y = target.position.y
