# ee-elevators-master
Simple fivem Elevator Script

Welcome to the EE Elevator Script, a powerful resource that brings vertical transportation to your FiveM server. This script allows you to add elevators to different locations, providing an immersive experience for your players.

## Features
- Easy configuration: Simply add elevator details to the configuration file and customize various settings.
- Multiple frameworks supported: Choose between ESX and QBCore frameworks based on your server setup.
- Interactive 3D text: Engage players with interactive 3D text for elevator interactions.
- Menu integration: Seamlessly integrate with popular menus like NH-Context or QB-Menu.
- Notification system: Notify players with helpful hints and messages when interacting with elevators.
- Job and item restrictions: Control access to specific floors based on player jobs and required items.
- Extensive customization: Tailor elevators to your server's unique needs by modifying coordinates, labels, and more.
  
## Getting Started
To get started with the Elevator Script, follow these steps:
1. Ensure you have the required dependencies installed (ESX or QBCore) depending on your chosen framework.
2. Download the latest release of the Elevator Script from the [releases](link-to-releases) section.
3. Add the script to your FiveM server's resource folder.
4. Rename the folder to "ee-elevators" for consistency.
5. Customize the elevator configuration in the `config.lua` file to match your server's setup.
6. Start the resource in your server.cfg file: `start ee-elevator`.


## Example Usage

To add an elevator, modify the elevator configuration in the `config.lua` file. Here's an example of how to add a new elevator:

```lua
MyBuildingElevator = {
	{
		coords = vector3(123.45, -67.89, 50.0),
		heading = 180.0,
		level = "Floor 1",
		label = "Lobby",
		jobs = {
			["police"] = 3,
			["ems"] = 2,
		},
		items = {
			"security_keycard",
		},
	},
	{
		coords = vector3(123.45, -67.89, 100.0),
		heading = 180.0,
		level = "Floor 2",
		label = "Office",
	},
}
```
In this example, we added an elevator for a building with two floors. The first floor, labeled as "Lobby," requires players to have a police job with a grade of 3 or an EMS job with a grade of 2 and possess a "security_keycard" item. The second floor, labeled as "Office," is accessible to all players.

Contributing
Contributions to the Elevator Script are welcome! If you have any ideas, improvements, or bug fixes, please submit them as issues or pull requests in this repository.

We hope you enjoy using the Elevator Script in your FiveM server. Happy lifting!
