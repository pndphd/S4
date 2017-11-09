//SHAM model main

#import <simtools.h> 
#import <simtoolsgui.h>
#import "ObserverSwarm.h"
#import "BatchSwarm.h"

int
main (int argc, const char ** argv)
{
	id theTopLevelSwarm;
 
	// Swarm initialization
	initSwarm (argc, argv);
	//Check if run in batch mode or graphics mode
	if (swarmGUIMode == YES)
	{
		theTopLevelSwarm = [ObserverSwarm createBegin: globalZone];
		SET_WINDOW_GEOMETRY_RECORD_NAME (theTopLevelSwarm);
		theTopLevelSwarm = [theTopLevelSwarm createEnd];
	}
	else
	{
		theTopLevelSwarm =  [BatchSwarm create: globalZone];
	}
	
	//Build internal object & activate swarm

	[theTopLevelSwarm buildObjects];

	[theTopLevelSwarm buildActions];
	// Top-level swarm is activated in nil

	[theTopLevelSwarm activateIn: nil];	

	[theTopLevelSwarm go];

	// the swarm has finished 
	return 0;
}


