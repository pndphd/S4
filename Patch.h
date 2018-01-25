//Header file for gravel patch
#import "Parameters.h"
#import "Redd.h"
#import <objectbase/SwarmObject.h>

@interface Patch: SwarmObject 

{
	//the total area of the patch in m^2
	double area;
	double velocity;
	double maxCoordinate;
	double depth;
	double probablity;
	int number;
	//Trackers
	int hatchedEggs;
	int killedEggs;
	int spilledEggs;
	int superimposedRedds;
	int reddCount;
	// Make ther redd list
	id reddList;
}

- initPatchNumber: (int) n withParameters: (Parameters*) p;
- createEnd;
- initNewPatch;
- (double) getArea;
- (int) getNumber;
- (int) getReddCount;
- addToReddCount;
- (int) getHatchedEggs;
- setHatchedEggs: (int) eggs;
- (int) getKilledEggs;
- setKilledEggs: (int) eggs;
- (int) getSpilledEggs;
- setSpilledEggs: (int) eggs;
- (int) getSuperimposedRedds;
- superimposeRedd;
- (double) getMaxCoordinate;
- (double) getPatchProbablity;
- getList;
- resetList;
- stepInPatch;
 
@end