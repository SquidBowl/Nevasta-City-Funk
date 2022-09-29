package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class GaleryArtState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var imageArray:Array<AttachedSprite> = [];
	private var artStuff:Array<Array<String>> = [];

    var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

    override function create()
        {
            #if desktop
            // Updating Discord Rich Presence
            DiscordClient.changePresence("In the Menus", null);
            #end
    
            persistentUpdate = true;
            bg = new FlxSprite().loadGraphic(Paths.image('art_galery'));
            add(bg);
            bg.screenCenter();
            
            grpOptions = new FlxTypedGroup<Alphabet>();
            add(grpOptions);
    
            #if MODS_ALLOWED
            var path:String = 'modsList.txt';
            if(FileSystem.exists(path))
            {
                var leMods:Array<String> = CoolUtil.coolTextFile(path);
                for (i in 0...leMods.length)
                {
                    if(leMods.length > 1 && leMods[0].length > 0) {
                        var modSplit:Array<String> = leMods[i].split('|');
                        if(!Paths.ignoreModFolders.contains(modSplit[0].toLowerCase()) && !modsAdded.contains(modSplit[0]))
                        {
                            if(modSplit[1] == '1')
                                pushModArtToList(modSplit[0]);
                            else
                                modsAdded.push(modSplit[0]);
                        }
                    }
                }
            }
    
            var arrayOfFolders:Array<String> = Paths.getModDirectories();
            arrayOfFolders.push('');
            for (folder in arrayOfFolders)
            {
                pushModArtToList(folder);
            }
            #end
    
            var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color

                ['Art Stuff'],
			    ['omg is nate from ncf',				'the origin'],

            ];
		
            for(i in pisspoop){
                artGaleryStuff.push(i);
            }
        
            for (i in 0...artStuff.length)
            {
                var isSelectable:Bool = !unselectableCheck(i);
                var optionText:Alphabet = new Alphabet(0, 70 * i, artStuff[i][0], !isSelectable, false);
                optionText.isMenuItem = true;
                optionText.screenCenter(X);
                optionText.yAdd -= 70;
                if(isSelectable) {
                    optionText.x -= 70;
                }
                optionText.forceX = optionText.x;
                //optionText.yMult = 90;
                optionText.targetY = i;
                grpOptions.add(optionText);
    
                if(isSelectable) {
                    if(artGaleryStuff[i][5] != null)
                    {
                        Paths.currentModDirectory = artStuff[i][5];
                    }    

                    
				var art:AttachedSprite = new AttachedSprite('artGalery/' + artStuff[i][1]);
				art.xAdd = optionText.width + 10;
				art.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				imageArray.push(image);
				add(image);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
		}

        descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

    var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(artStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-1 * shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(1 * shiftMult);
					holdTime = 0;
				}
                
                if(controls.UI_DOWN || controls.UI_UP)
                    {
                        var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
                        holdTime += elapsed;
                        var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);
    
                        if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
                        {
                            changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
                        }
                    }
                }
    
                if(controls.ACCEPT && (artStuff[curSelected][3] == null || artStuff[curSelected][3].length > 4)) {
                    CoolUtil.browserLoad(artStuff[curSelected][3]);
                }
                if (controls.BACK)
                {
                    if(colorTween != null) {
                        colorTween.cancel();
                    }
                    FlxG.sound.play(Paths.sound('cancelMenu'));
                    MusicBeatState.switchState(new MainMenuState());
                    quitting = true;
                }
            }
            
            for (item in grpOptions.members)
            {
                if(!item.isBold)
                {
                    var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
                    if(item.targetY == 0)
                    {
                        var lastX:Float = item.x;
                        item.screenCenter(X);
                        item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
                        item.forceX = item.x;
                    }
                    else
                    {
                        item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
                        item.forceX = item.x;
                    }
                }
            }
            super.update(elapsed);
        }
    
        var moveTween:FlxTween = null;
        function changeSelection(change:Int = 0)
        {
            FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
            do {
                curSelected += change;
                if (curSelected < 0)
                    curSelected = artStuff.length - 1;
                if (curSelected >= artStuff.length)
                    curSelected = 0;
            } while(unselectableCheck(curSelected));
    
            var newColor:Int =  getCurrentBGColor();
            if(newColor != intendedColor) {
                if(colorTween != null) {
                    colorTween.cancel();
                }
                intendedColor = newColor;
                colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
                    onComplete: function(twn:FlxTween) {
                        colorTween = null;
                    }
                });
            }
    
            var bullShit:Int = 0;
    
            for (item in grpOptions.members)
            {
                item.targetY = bullShit - curSelected;
                bullShit++;
    
                if(!unselectableCheck(bullShit-1)) {
                    item.alpha = 0.6;
                    if (item.targetY == 0) {
                        item.alpha = 1;
                    }
                }
            }
    
            descText.text = artStuff[curSelected][2];
            descText.y = FlxG.height - descText.height + offsetThing - 60;
    
            if(moveTween != null) moveTween.cancel();
            moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});
    
            descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
            descBox.updateHitbox();
        }

        function getCurrentBGColor() {
            var bgColor:String = artStuff[curSelected][4];
            if(!bgColor.startsWith('0x')) {
                bgColor = '0xFF' + bgColor;
            }
            return Std.parseInt(bgColor);
        }
    
        private function unselectableCheck(num:Int):Bool {
            return artStuff[num].length <= 1;
        }
    }