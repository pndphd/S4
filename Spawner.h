#import "ReddList.h"
#import "Habitat.h"
#import "Patch.h"
#import <objectbase/SwarmObject.h>
#import <random.h>


@interface Spawner: SwarmObject

{
	Parameters * parameters;
	BOOL selectiveFlag;
	double guardTime;
	int ID;	
	int eggCount;
	int day;
	
	BOOL erase;
	BOOL qued;
	BOOL spawned;
	BOOL alive;
	int postSpawningDays;
	int postArrivalDays;
	int spilledEggs;

	id redd;
	BOOL open;
	double distance;
	double overlap;
	double x, y;
	double patchChoice;
	double patchLevel;
	double patchLevelOld;
	
	int i, j;
}

//create a new spawner with a size and ID
- createNewSpawnerWithSize: (double) size ID: (int) id andParameters: (Parameters *) p onDay: (int) d;
//Just here to seperate creation method from others
- createEnd; 
//initalize the new spawner
- initNewSpawner;
- assessPatch: patch;
- stepInHabitat: habitat;
- (int) getSpilledEggs;
- (BOOL) getHasSpawned;
- (BOOL) getIsAlive;
- setEraseFlag;
- setQueFlag;
- (int) getDay;
- (BOOL) getEraseFlag;
- (BOOL) getQueFlag;

@end