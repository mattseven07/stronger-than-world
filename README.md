Minimal 2D platformer built with Godot.

## Requirements
- Godot 4.5 (project file: [project.godot](project.godot))

## Run
1. Open the project in Godot.
2. Set the main scene if needed (project file already sets the run scene).
3. Run the game from the editor.

## Controls
- Move: A / D or configured input actions
- Jump: configured "jump" input action (see [project.godot](project.godot))

## Project structure (key files)
- Levels: [levels/level_1.tscn](levels/level_1.tscn), [levels/level_2.tscn](levels/level_2.tscn)
- Player script: [`player._physics_process`](scripts/player.gd) — movement & jump logic
- Gap trigger/puller:
  - [`gap_trigger._on_body_entered`](scripts/gap_trigger.gd) / [`gap_trigger.move_platform`](scripts/gap_trigger.gd)
  - [`gap_puller._on_body_entered`](scripts/gap_puller.gd) / [`gap_puller.move_platform`](scripts/gap_puller.gd)
- Level management: [`level_1.fade_and_next_level`](scripts/level_1.gd)
- Coin pickup: [`coin._on_body_entered`](scripts/coin.gd)
- Camera shake: [`camera_2d.shake`](scripts/camera_2d.gd)

## How levels work
- Tilemaps and tilesets are stored inside each level `.tscn`.
- Triggers use Area2D nodes and call scripts listed above to move platforms or change scenes.

## Editing tips
- To change the next level after collecting the coin, edit `next_level` in [levels/level_1.tscn](levels/level_1.tscn) or update [`level_1.fade_and_next_level`](scripts/level_1.gd).
- Adjust platform move amounts / speeds in the exported variables of the gap trigger scripts:
  - [scripts/gap_trigger.gd](scripts/gap_trigger.gd)
  - [scripts/gap_puller.gd](scripts/gap_puller.gd)

## Contributing
- Open an issue for bugs or feature requests.
- Send PRs against the main branch.![strongerthanworld1](https://github.com/user-attachments/assets/7e50ff64-d9f9-4cb9-a438-6d45a1c6378a)
