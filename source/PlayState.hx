package;

import flixel.FlxSubState;
import flixel.addons.ui.FlxUISubState;
import flixel.math.FlxMath;

import ui.*;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUIText;
import flixel.addons.ui.FlxUISprite;
import flixel.addons.ui.FlxUIList;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.FlxG;
import flixel.FlxObject;
import openfl.Lib;
import openfl.Assets;

class PlayState extends FlxUIState
{
	public var dirtGround:FlxUISprite;
	var subTestState:FlxUISubState;
	var gnome:Gnome;
	
	override public function create():Void
	{
		super.create();
		
		destroySubStates = false;
		
		subTestState = new SubTextMenu();
		
		initializateState();
	}
	
	function initializateState()
	{
		var skyBackground = new FlxUISprite(0, 0, Assets.getBitmapData("assets/images/Sky.png"));
		add(skyBackground);
		
		var grassBackground:Grass = new Grass(0, 320);
		add(grassBackground);
		
		dirtGround = new FlxUISprite(0, 620, Assets.getBitmapData("assets/images/Dirt.png"));
		dirtGround.immovable = true;
		//dirtGround.allowCollisions = FlxObject.ANY;
		add(dirtGround);
		
		gnome = new Gnome(0, 520, this);
		add(gnome);
		
		var Buttooon = new Button(0, 0, _tongue.get("$MISC_OK", "ui"), ClickPlay);
		Buttooon.screenCenter();
		add(Buttooon);
		
		//FlxG.worldBounds.set(0, 0, 1280, 720);
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.collide(gnome, dirtGround);
		
		super.update(elapsed);
	}
	
	function ClickPlay()
	{
		openSubState(subTestState);
	}
}

/*flxButton = new FlxBitmapTextButton(40, 40, "Play", ClickPlay);
		flxButton.loadGraphic("assets/images/Simple_Button.png", true, 50, 50);
		
		button = new FlxUIButton(10, 10, "Play", ClickPlay);
		//button.loadGraphicSlice9(["assets/images/Simple_Button.png"], 50, 50 );
		
		add(button);
		add(flxButton);
		
		
        // Make the screen background lighter for visibility sake
        FlxG.camera.bgColor = 0xFF999999;
		
        // This is a normal image, which cannot be resized
        var myImage = new FlxSprite(10, 10);
        myImage.loadGraphic("assets/images/blue_button07.png");
        add(myImage);
		
        // This is a basic 9-slice image with default skin
        var myDefaultImage1 = new FlxUI9SliceSprite(100, 10, null, new Rectangle(0,0,50,50));
        var myDefaultImage2 = new FlxUI9SliceSprite(100, 70, null, new Rectangle(0,0,100,50));
        var myDefaultImage3 = new FlxUI9SliceSprite(100, 130, null, new Rectangle(0,0,50,100));
        add(myDefaultImage1);
        add(myDefaultImage2);
        add(myDefaultImage3);
		
        // This is a 9-slice image with the image loaded and sliced
        var _graphic:String = "assets/images/blue_button07.png";
        // This is the [x1,y1,x2,y2] slice points in the image.
        // x1,y1 is the top-left, x2,y2 is the bottom-right.
        var _slice:Array<Int> = [10,10,40,40];
        var myCustomImage1 = new FlxUI9SliceSprite(210, 10, _graphic, new Rectangle(0,0,50,50), _slice);
        var myCustomImage2 = new FlxUI9SliceSprite(210, 70, _graphic, new Rectangle(0,0,100,50), _slice);
        var myCustomImage3 = new FlxUI9SliceSprite(210, 130, _graphic, new Rectangle(0,0,50,100), _slice);
        add(myCustomImage1);
        add(myCustomImage2);
        add(myCustomImage3);
		
        // This is a 9-slice button with default skin
        var myButton = new FlxUITypedButton(100, 240);
        myButton.resize(100,50);
        add(myButton);
 
        // This is a 9-slice button with 3 different images for the 3 states
        var myButton9Slice = new FlxUITypedButton(210, 240);
        var _graphic_up:String = "assets/images/blue_button07.png";
        var _graphic_hover:String = "assets/images/green_button07.png";
        var _graphic_down:String = "assets/images/blue_button08.png";
        var _graphicArray:Array<String> = [_graphic_up, _graphic_hover, _graphic_down];
        var _sliceArray:Array<Array<Int>> = [_slice, _slice, _slice]; // all 3 buttons have same slicing
        myButton9Slice.loadGraphicSlice9(_graphicArray, 100, 50, _sliceArray);
        add(myButton9Slice);
 
        // This is a 9-slice button with 3 images in one spritesheet for the 3 states
        // Note: images are processed VERTICALLY
        // Note: image sheet's height must be at least 3 button's height
        // (for each state; up, hover, down), otherwise the game will crash.
        // E.g. if the original button size is 50x50, then the spritesheet
        // size must be AT LEAST 50x150.
        
		//myButton9Slice255.label = "test";
        //var _graphic_sheet:String = "assets/images/sheet_button.png";*/