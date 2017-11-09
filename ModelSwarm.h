// ModelSwarm.h
#import "Que.h"
#import "Day.h"
#import "Habitat.h"
#import "Spawner.h"
#import "Tracker.h"
#import "Patch.h"
#import <objectbase/SwarmObject.h>
#import <objectbase/Swarm.h>

@interface ModelSwarm: Swarm
{
	Parameters* parameters;
	
	id reddList;
	id day;
	id habitat;
	id patch;
	id que;
	id tracker;
	id reaperQue;
	id reaperPreQue;
	id reaperReddQue;
	id modelActions;
	id modelSchedule;

	int totalDays;
	int replicate ;
	int iteration ;
}

+ createBegin: aZone;
- createEnd;
- getTracker;
- getDayCounter;
- getParameters;
- buildObjects;
- buildActions;
- (id <Activity>)activateIn: swarmContext;
- checkToReset;
- clean;
- mark;
- (int) getReplicate;
- (int) getReplicates;
- (int) getIteration;
- (int) getIterations;

@end