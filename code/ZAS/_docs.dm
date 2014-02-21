/*

Zone Air System:

This air system divides the station into impermeable areas called zones.
When something happens, i.e. a door opening or a wall being taken down,
zones equalize and eventually merge. Making an airtight area closes the connection again.

Control Flow:
Every air tick:
	Marked turfs are updated with update_air_properties(), followed by post_update_air_properties().
	Edges, including those generated by connections in the previous step, are processed. This is where gas is exchanged.
	Fire is processed.
	Marked zones have their air archived.

Important Functions:

air_master.mark_for_update(turf)
	When stuff happens, call this. It works on everything. You basically don't need to worry about any other
	functions besides CanPass().

*/

//#define ZASDBG

#define AIR_BLOCKED 1
#define ZONE_BLOCKED 2
#define BLOCKED 3