# Godot-Random-Character-Generator-Addon
A Godot Addon to generate random characters from spritesheets

## App
It comes with an app where you can generate and download random spritesheets:

![app](/screenshots/app.jpg)

To run the app, just download the repository, import the project to Godot, and run it. You can [run it from the browser on itch.io](https://mateu-s.itch.io/random-character-generator) too.

The [art of the example](https://almostapixel.itch.io/small-burg-village-pack) is made by almostApixel and therefore is subject to his license. The [up and down arrows](https://www.kenney.nl/assets/input-prompts-pixel-16) are made by [Kenney](https://www.kenney.nl)

### Instructions
By default, it will appear an example with a few spritesheets. If you press the reset button, all of the images will be deleted and you will end with an empty element at the left bar.

* To select the image press the change button.
* To generate a random cell from the image, you need to specify the horizontal and vertical cells. For example, this image has 1 horizontal cell and 2 vertical cells:

![bodies spritesheet](/assets/SmallBurg_village_pack_v1.5/Character/Character_Skintones.png)

* With ignore start and ignore end you can exclude cells. For example, with ignore start set to 0 and ignore end to 1, the previous image will always pick the black skin color.
* Allow empty will add a possibility of not choosing any cell. For example, if you have a spritesheet for the hairs and you mark allow empty, the generated character maybe will be bald.
If you want to add more images, click the "Add new" button.

After configuring all the images, click generate and a random character will be generated for you!

## Addon
To add the addon to your project, copy the addons folder, or the folder inside it if you already have an addons folder, to your project folder. Then go to project->project settings->plugins and enable it. More information at the Godot Docs: https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html

The addon has a custom node that will help you generate the random character, the RandCharacterSprite node. Add the node:

![add the node](/screenshots/add_node.jpg)

Then, in the node inspector, you can configure each spritesheet:

![node properties](/screenshots/node_properties.jpg)

I couldn't find a way of changing the quantity of images in the inpector, if you need more than 6 images, you can open the node script and add a new SpritesheetData class in the character_data array, the new image properties will appear back at the editor.

![increase images](/screenshots/increase_images.jpg)

Also, to make the generated character different every time, you must call the randomize function somewhere at the start of your game.
