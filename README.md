# 🦖 **Alien Rush** - Juego de Plataformas al Estilo Doodle 

<div align="center">
  <img src="![image](https://github.com/user-attachments/assets/d4b6cb7b-097c-410e-b4d2-cff346678c19)
" alt="Gameplay animado" width="300">
  <br>
  <em>¡Esquiva obstáculos y alcanza el récord!</em>
</div>

---

## 🎮 **Descripción**
¡Salta como un alien furioso en este juego inspirado en el clásico Doodle Jump! Desarrollado en **Godot 4** con GDscript, cuenta con:

- Sistema de puntuación online con **Silent Wolf**
- Física de salto adictiva
- Obstáculos generados proceduralmente
- Modo infinito

---

## 📸 **Capturas**
| Gameplay | Game over | Ranking Global |
|----------|-----------|----------------|
| <img src="assets/screenshots/gameplay.png" width="200" alt="Captura de gameplay"> | <img src="assets/screenshots/game_over.png" width="200" alt="Pantalla de game over"> | <img src="assets/screenshots/leaderboard.png" width="200" alt="Tabla de puntuaciones"> |

---

## 🛠️ **Tecnologías**
```plaintext
- Motor: Godot 4.2
- Lenguaje: GDScript
- Base de datos: Silent Wolf (API REST)
- Sonidos: .mp3
- Arte: Pixel Art (Aseprite)
```
## 🛠️ **Instalación**
```
Descarga Godot 4.2+ desde godotengine.org
git clone https://github.com/IvanNavas092/Doodle-Game-.git
Ejecuta game
```
## 📂 **Estructura del Proyecto**
```
res://
├── addons/ # Plugins y extensiones
├── assets/ # Recursos multimedia
│ ├── fonts/ # Fuentes del juego
│ ├── sounds/ # Efectos de sonido y música
│ └── screenshots/ # Capturas para documentación
├── character/ # Assets y scripts del personaje
│ ├── sprites/ # Animaciones
│ └── controller.gd # Lógica de movimiento
├── environments/ # Escenarios y plataformas
│ ├── platforms/ # Sprites de plataformas
│ └── generator.gd # Generación procedural
├── scripts/ # Código principal
│ ├── game.gd # Lógica principal
│ └── silent_wolf_integration.gd # Ranking online
├── game.tscn # Escena principal
└── game.gdshader # Efectos visuales
```






