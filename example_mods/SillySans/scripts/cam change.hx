function onStepHit():Void {
  if (curStep == 3440) {
   FlxG.cameras.list.insert(FlxG.cameras.list.indexOf(game.camGame) - 1, game.camOther);
  }
  return;
}