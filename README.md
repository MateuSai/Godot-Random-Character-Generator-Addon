# Godot-Random-Character-Generator-Addon
A Godot Addon to generate random characters from spritesheets

## App
It comes with an app where you can generate and download random spritesheets:

![app](/screenshots/app.jpg)

To run the app, just download the repository, import the project to Godot, and run it.

The [art of the example](https://almostapixel.itch.io/small-burg-village-pack) is made by almostApixel and therefore is subject to his license. The [up and down arrows](https://www.kenney.nl/assets/input-prompts-pixel-16) are made by [Kenney](https://www.kenney.nl)

## Addon
To add the addon to your project, copy the addons folder, or the folder inside it if you already have an addons folder, to your project folder. Then go to project->project settings->plugins and enable it. More information at the Godot Docs: https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html

The addon has a custom node that will help you generate the random character, the RandCharacterSprite node. Add the node:

![add the node](/screenshots/add_node.jpg)

Then, in the node inspector, you can configure each spritesheet:

![node properties](/screenshots/node_properties.jpg)

I couldn't find a way of changing the quantity of images in the inpector, if you need more than 6 images, you can open the node script and add a new SpritesheetData class in the character_data array, the new image properties will appear back at the editor.

![increase images](/screenshots/increase_images.jpg)

Also, to make the generated character different every time, you must call the randomize function somewhere at the start of your game.
