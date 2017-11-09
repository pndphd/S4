#import "Que.h"
#import "Day.h"
#import "Patch.h"
#import "ReddList.h"
#import "Spawner.h"
#import "Parameters.h"
#import <objectbase/SwarmObject.h>

@interface Tracker: SwarmObject
{
	FILE *outputFile;
	FILE *outputSummaryFile;
	Parameters * parameters;
	
	int iterationCounter;
	int fishCounter;
	int oldFishCounter;
	int spawnedCounter;
	int guardingCounter;
	int superimposedCounter;
	int spilledEggsCounter;
	int killedEggsCounter;
	int hatchedEggsCounter;
	
	int uberFishCounter;
	int uberSpawnedCounter;
	int uberGuardingCounter;
	int uberSuperimposedCounter;
	int uberSpilledEggsCounter;
	int uberKilledEggsCounter;
	int uberHatchedEggsCounter;
	int uberReddCounter;
	int ret;
	
	int reddCount;
	int killedEggs;
	int superimposedRedds;
	int spilledEggs;
	int hatchedEggs;
			
	id spawner;
}

- createEnd;
- initTrackerWithParameters: (Parameters *) p;
- updateTrackerForSpawners:  que ;
- updateTrackerForHabitat: patch onDay:   dayCount;
- (int) getFishCounter;
- resetTracker;

@end