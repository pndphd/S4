#import "Patch.h"


@implementation Patch

- initPatchNumber: (int) n withParameters: (Parameters*) p
{
	velocity = [p getPatchVelocity: n];
	number = n;
	area = [p getPatchArea: n];
	maxCoordinate = sqrt([p getPatchArea: n]) - [p getGuardRadius];
	depth = [p getPatchDepth: n];
	probablity = [p getPatchProbablity: n];
	reddCount = 0;
	hatchedEggs = 0;
	killedEggs = 0;
	spilledEggs = 0;
	superimposedRedds = 0;
	reddList = [List create: [self getZone]];
	[reddList deleteAll];
	return self;
}

- createEnd
{
	return self;	 
}

- initNewPatch
{
	reddCount = 0;
	hatchedEggs = 0;
	killedEggs = 0;
	spilledEggs = 0;
	superimposedRedds = 0;
	return self;
}

- (double) getArea
{
	return area;
}

- (int) getReddCount
{
	return reddCount;
}

- addToReddCount
{
	reddCount++;
	return self;
}

- (int) getHatchedEggs;
{
	return hatchedEggs;
}

- setHatchedEggs: (int) eggs;
{
	hatchedEggs = hatchedEggs + eggs;
	//printf("Out Loop Hatched: %d\n", hatchedEggs);
	return self;
}

- (int) getKilledEggs;
{
	return killedEggs;
}

- setKilledEggs: (int) eggs;
{
	killedEggs = killedEggs + eggs;
	//printf("Out Loop Killed: %d\n", killedEggs);
	return self;
}

- (int) getSpilledEggs;
{
	return spilledEggs;
}

- setSpilledEggs: (int) eggs;
{
	spilledEggs = spilledEggs + eggs;
	return self;
}

- (int) getSuperimposedRedds;
{
	return superimposedRedds;
}

- superimposeRedd;
{
	superimposedRedds++;
	return self;
}

- (double) getMaxCoordinate;
{
	return maxCoordinate;
}

- getList
{
	return reddList;
}

- (int) getNumber
{
	return number;
}

- resetList
{
	[reddList deleteAll];
	return self;
}

- (double) getPatchProbablity
{
	return probablity;
}

- stepInPatch
{
	// itterate through each redd currently in the patch
	id <Index> reddIndex = nil;
	reddIndex = [reddList begin: [self getZone]];

	while (([reddIndex next]))
	{
		[[reddIndex get] stepInPatch: self];
	}

	[reddIndex drop];
	return self;
}

 @end