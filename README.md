# 🦖 **Alien Rush** - Juego de Plataformas al Estilo Doodle

<p align="center">
  <img src="https://github.com/user-attachments/assets/5e220741-3f55-4dc3-b286-b164f307ad58" width="200" alt="Alien Rush portada">
</p>

<em>¡Esquiva obstáculos y alcanza el récord!</em>

---

## 🎮 **Descripción**

¡Salta como un alien furioso en este juego inspirado en el clásico Doodle Jump!  
Desarrollado en **Godot 4** con **GDScript**, incluye:

- 🔢 Sistema de puntuación online con **Silent Wolf**
- 🌀 Física de salto adictiva
- 🎲 Obstáculos generados proceduralmente
- ♾️ Modo infinito
  
  
  ## 📸 **Capturas**
 | Gameplay | Game Over | Ranking Global |
|----------|-----------|----------------|
| <img src="https://github.com/user-attachments/assets/64dbab54-c036-465d-96a9-24bf0d388037" width="300" alt="Gameplay"> | <img src="https://github.com/user-attachments/assets/31013cce-ee6a-4ecc-8db1-c574ef5a2d03" width="300" alt="Game Over"> | <img src="https://github.com/user-attachments/assets/16c76e11-2744-4f64-9599-9131dfd0cc04" width="300" alt="Ranking"> |
  
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
1. Descarga Godot 4.2+ desde https://godotengine.org
2. Clona el repositorio:
   git clone https://github.com/IvanNavas092/Doodle-Game-.git
3. Abre el proyecto en Godot y ejecuta `game.tscn`
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
  
  
  
  
  
  
