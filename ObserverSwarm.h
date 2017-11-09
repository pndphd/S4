
#import <simtoolsgui.h>
#import <analysis.h> // EZGraph
#import "ModelSwarm.h"

#import <simtoolsgui/GUISwarm.h>

@interface ObserverSwarm: GUISwarm
{
	// one parameter: update freq
	int displayFrequency;				
	
	// schedule data structs
	id displayActions;				
	id displaySchedule;
	
	// the Swarm we're observing
	ModelSwarm *modelSwarm;	  	

	// Widgets
	// allocate colours
	id <Colormap> colormap;	
	// 2d display widget  
	id <ZoomRaster> worldRaster;		
	// graphing widget  
	id <EZGraph> graph1;			
  
}

+ createBegin: aZone;
- createEnd;
- buildObjects;
- buildActions;
- (id <Activity>)activateIn: swarmContext;

@end
