# Candy Collector

Automate candy collection in Lsplash boss fights for FiveM servers.

## Features

- Automated candy collection during Lsplash boss fight
- Start and stop candy collection with commands
- Track collected candies in a database

## Requirements

- FiveM server with ESX framework
- MySQL database

## Installation

1. Download the script files.
2. Place them in your FiveM server's resources folder.
3. Add `start candy-collector` to your server.cfg file.

## Usage

### Commands

| Command | Description |
|---------|-------------|
| /startcandycollection | Start candy collection |
| /stopcandycollection | Stop candy collection |

### Permissions

No special permissions are required to use this script.

## Configuration

Edit the `config.lua` file to customize the script settings:

```lua
Config = {}

-- Candy collection settings
Config.CandyModel = 'prop_candy'
Config.CandyCollectionRadius = 5.0
Config.CandyCollectionInterval = 1000 -- in milliseconds

-- Boss fight settings
Config.BossFightLocation = vector3(1500.0, 3000.0, 50.0)
Config.BossFightRadius = 20.0

-- Reward settings
Config.CandyReward = 10
Config.CandyRewardItem = 'candy'
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=candy-collector&utm_content=bottom) — describe it in one sentence and get the full source code.