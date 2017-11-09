// BatchSwarm.h

#import "ModelSwarm.h"
#import <objectbase.h>
#import <objectbase/Swarm.h>

@interface BatchSwarm: Swarm
{
	ModelSwarm * modelSwarm;       
}

+ createBegin: aZone;
- createEnd;
- buildObjects;

- buildActions;
- (id <Activity>)activateIn: swarmContext;
- go;
- (void)drop;

@end

