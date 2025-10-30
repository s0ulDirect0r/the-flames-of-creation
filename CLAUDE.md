# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

"The Flames of Creation" is a tactical, turn-based RPG built with Godot 4.5. The game is set in a high-fantasy tropical island world and follows a fire mage's story. The project is in early initialization stages.

## Project Structure

- `the-flames-of-creation/` - Main Godot project directory
  - `project.godot` - Godot project configuration file (Godot 4.5, GL Compatibility renderer)
  - `.godot/` - Generated Godot cache and build artifacts (ignored by git)
- `gdd.md` - Game design document with aesthetic and concept notes

## Development Commands

### Running the Project

- **Run editor**: `godot --path the-flames-of-creation`
- **Run game directly**: `godot --path the-flames-of-creation --headless`
- **Export build**: `godot --path the-flames-of-creation --headless --export-release`

Godot 4.5.1 is installed at `/Applications/Godot.app` with symlink at `/usr/local/bin/godot`.

### Project Configuration

- Engine: Godot 4.5
- Rendering: GL Compatibility mode (mobile and desktop)
- The actual Godot project files are in the `the-flames-of-creation/` subdirectory, not the repository root

## Code Architecture

This project is newly initialized. As the codebase develops, key architectural patterns for Godot projects to follow:

- **Scenes**: `.tscn` files define game objects, UI, and levels
- **Scripts**: `.gd` files (GDScript) contain game logic
- **Resources**: `.tres` files store game data and configurations
- **Assets**: Sprites, audio, and other media files

When creating new game systems, follow Godot's node-based architecture where functionality is composed through scene trees rather than deep inheritance hierarchies.
