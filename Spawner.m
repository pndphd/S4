#import "Spawner.h"
#import "math.h"

@implementation Spawner

- createNewSpawnerWithSize: (double) size ID: (int) id andParameters: (Parameters *) p onDay: (int) d 
{
	parameters = p;
	ID = id;
	day = d;
	// set ther egg count based on size
	eggCount = (int)([parameters getFishFecundIntercept]
	*pow(size,[parameters getFishFecundSlope]));
	guardTime = [parameters getGuardTime];
	//Make it selective or not based on a random draw form uniform distribution 
	if([uniformDblRand getDoubleWithMin: 0 withMax: 1] > [parameters getPrefer])
	{
		selectiveFlag = NO;
	}
	else
	{
		selectiveFlag = YES;
	}
	return self;
}

- createEnd
{
	return self;
}

- initNewSpawner
{
	spawned = NO;
	alive = YES;
	erase = NO;
	qued = NO;
	postArrivalDays = 0;
	postSpawningDays = 0;
	spilledEggs = 0;
	return self;
}



- stepInHabitat: habitat 
{	
	//printf("Start Step in Habitat.\n");
	j = 9999;
	postArrivalDays++;
	if( spawned == NO && alive == YES)
	{
		patchChoice = [uniformDblRand getDoubleWithMin: 0 withMax: 1];
		id <Index> patchIndex = nil;
		patchIndex = [[habitat getList] begin: [self getZone]];
		
		// Find which patch to look at today
		patchLevel = 0;
		while (([patchIndex next]))
		{
			patchLevelOld = patchLevel;
			patchLevel = patchLevel + [[patchIndex get] getPatchProbablity];
			//printf("%lf < %lf < %lf\n", patchLevelOld, patchChoice, patchLevel);
			if(patchChoice <= patchLevel && patchChoice > patchLevelOld)
			{
				j = [[patchIndex get] getNumber];
			}
		}
		[patchIndex drop];
		[self assessPatch: [habitat getPatch: j]];
	}

	// Check if you should be dead
	if (postArrivalDays == [parameters getTimeLimit] && spawned == NO)
	{
		[[habitat getPatch: 0] setSpilledEggs: eggCount];
		alive = NO;
		spawned = YES;
		erase = YES;
	}
	//printf("End Step in Habitat.\n");
	return self;
}

- assessPatch: patch 
{
	//printf("Begin Assess PAtch.\n");
	int w;
	open = NO;
	// if the fish is not selective or there ar no redds yet spawn in a random 
	// place that is open
	if (selectiveFlag == NO || [[patch getList] getCount] ==0)
	{
		for (i=0; i < [parameters getSearchEffort]; i++)
		{	
			x = [uniformDblRand getDoubleWithMin: [parameters getGuardRadius] withMax: [patch getMaxCoordinate]];
			y = [uniformDblRand getDoubleWithMin: [parameters getGuardRadius] withMax: [patch getMaxCoordinate]];

			id <Index> reddIndex = nil;
			reddIndex = [[patch getList] begin: [self getZone]];
			//Assume ther chosen location is open until proved otherwise
			open = YES;
			// go through ther list of redds
			while ([reddIndex next])
			{
				//is ther redd guarded?
				if ([[reddIndex get] getGuardFlag] == YES )
				{ 
					// do the limits or the redds overlap?
					if( x > [[reddIndex get] getX]-[parameters getGuardRadius] &&
						x < [[reddIndex get] getX]+[parameters getGuardRadius] &&
						y > [[reddIndex get] getY]-[parameters getGuardRadius] &&
						y < [[reddIndex get] getY]+[parameters getGuardRadius])
					{   
						// would the 2 guarded areas overlap?
						// if so this location is not open.
						if ( sqrt(pow(([[reddIndex get] getX]-x),2) + pow(([[reddIndex get] getY]-y),2))<2*[parameters getGuardRadius])
						{
							open = NO;
							break;
						}
					}	
				}
			}
			[reddIndex drop];
			// if they found a location break otherwise keep looking
			if(open == YES)
			{
				break;
			}
		}
	}
	
	// if it's pickey and there are redds find one unguarded 
	else
	{
		//printf("Assess Patch After Selective.\n");
		for (i=0; i< [parameters getSearchEffort]; i++)
		{
			// get a random place in ther redd list
			w = [uniformIntRand getIntegerWithMin: 0 withMax: ([[patch getList] getCount]-1)];
			// check if it's open 
			if([[[patch getList] atOffset:w] getGuardFlag] == NO);
			{
				open = YES;
				x = [[[patch getList] atOffset:w] getX];
				y = [[[patch getList] atOffset:w] getY];
				break;
			}
		}
	}
	
	//printf("Assess Patch Beform They Make a Redd.\n");
	//  if they found a spot to make a redd do so
	if(open ==YES)
	{
		id <Index> reddIndex = nil;
		reddIndex = [[patch getList] begin: [self getZone]];
		// look through all redds to see if they superimpose one
		while ([reddIndex next])
		{
			if ([[reddIndex get] getGuardFlag] == NO)
			{
				if(x > [[reddIndex get] getX]-[parameters getReddRadius] &&
					x <[[reddIndex get] getX]+[parameters getReddRadius] &&
					y >[[reddIndex get] getY]-[parameters getReddRadius] &&
					y <[[reddIndex get] getY]+[parameters getReddRadius])
				{
					distance = sqrt(pow(([[reddIndex get] getX]-x),2) + pow(([[reddIndex get] getY]-y),2));
					if ( distance < 2*[parameters getReddRadius])
					{
						//calculate the area of overalp
						overlap = (2*pow([parameters getReddRadius],2)*acos(distance/2/[parameters getReddRadius])
							- distance/2*sqrt(4*pow([parameters getReddRadius],2)-pow(distance,2)))
							/(3.14*pow([parameters getReddRadius],2));
						[patch setKilledEggs: (int)[[reddIndex get] getNumberOfLiveEggs]*overlap];
						[[reddIndex get] killThisFractionOfEggs: overlap];	
						if([[reddIndex get] getSuperimposedFlag] == NO)
						{
							[patch superimposeRedd];
							[[reddIndex get] setSuperimposedFlag];
							
						}
					}
				}
			}
		}
		//printf("Assess Patch After Checked Super.\n");
		//Make ther redd and add it to the list
		spawned = YES;
		[patch addToReddCount];
		redd = [Redd createBegin: [self getZone]];
		[redd createNewReddInPatch: patch withX: x Y: y andParameters: parameters];
		redd = [redd createEnd];
		[redd initNewReddWithAnEggCountOf: eggCount];
		//printf("eggs: %d\n", eggCount);
		[[patch getList] addLast: redd];
		erase = YES;
		[reddIndex drop];
	}
	//printf("Assess Patch End.\n");
	return self;
}

- (BOOL) getHasSpawned
{
	return spawned;
}

- (BOOL) getIsAlive
{
	return alive;
}

- (int) getSpilledEggs;
{
	return spilledEggs;
}

- setEraseFlag;
{
	erase = YES;
	return self;
}

- (BOOL) getEraseFlag;
{
	return erase;
}

- setQueFlag;
{
	qued = YES;
	return self;
}

- (BOOL) getQueFlag;
{
	return qued;
}

- (int) getDay;
{
	return day;
}

@end