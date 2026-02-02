/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR maps = 0
VAR lanterns = 0 
VAR magic_lanterns = 0

-> central_ocean

== central_ocean ==
You wake up in a boat floating in the middle of the ocean. You try to look for land, but the heavy fog is making it impossible to see very far. Where would you like to go?
* [Go west] -> west_ocean 
* [Go east] -> east_ocean
* [Go north] -> north_ocean

== north_ocean ==
You sail north, but you feel like your going in circles, as you keep seeing the same familiar rock formations repeatedly. {not map_pickup: Is there something you need in order to progress?}
* [Go back] -> central_ocean
*{maps > 0} [Read map] -> ruins
== west_ocean ==
After sailing for a bit, you eventually make out a very small island through the thick fog
* [Land] -> west_island
* [Go back] -> central_ocean

== west_island ==
It's nice to finally feel solid ground again. {not lantern_pickup: You find an old bag buried in the sand, and in it theres a lantern.} 
*[Pick up lantern] -> lantern_pickup
*[Go back] -> central_ocean


== east_ocean ==
You set sail to the east. It takes a while, but you eventually make your way to the edge of cliff, never-ending in both directions. You find a cave opening big enough for your boat to float through
* [Go through cave] -> cave
* [Go back] -> central_ocean

== cave ==
The cave is very dark, and it would seem very unsafe to guide your boat through here.
* [Go back] -> central_ocean

*{lanterns > 0} [Light lantern] -> cave_lit

== cave_lit ==
The lantern emits a brilliant light, illuminating the cave walls around the ship. {not map_pickup:You find a treasure chest at the end of the cave containing a map.}
*[Take map] -> map_pickup
*[turn around] -> central_ocean


== lantern_pickup ==
~ lanterns = lanterns + 1
You find a lantern, but it's light looks pretty dim. perhaps the light may shine brighter in a darker location 
*[Nice!] -> west_island

== map_pickup ==
~ maps = maps + 1
You find a pretty dated map, the directions look confusing at first, but looks like you have to follow a certain path around some formations. Where could that be? 
*[Go back] -> cave_lit

== ruins ==
After maneuvering around the rock formations, you make your way to some ruins. For some reason, this place seems untouched by the fog. 

-> END