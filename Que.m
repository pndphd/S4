#import "Que.h"
#import "math.h"

@implementation Que

- createQueList
{
	spawnerQueList = [List create: [self getZone]];
	spawnerPreQueList = [List create: [self getZone]];
	return self;
}

- setQueDistributionWithParameters: (Parameters *) parameters 
{
	totalSpawners = [parameters getTotalNumberOfSpawners];
	// create a shuffler for the list
	listShuffler = [ListShuffler create: [self getZone]];
	//Make 1 normal distributions one for the arrival times 
	aNormalDist2 = [NormalDist create: [self getZone] setGenerator: randomGenerator];
	[aNormalDist2 setMean:[parameters getDayWithMostArrivals] setStdDev:[parameters getSDOfArrivalDays]];
	
	// Go through each spawner an get it an arrival day and length
	for(i=1; i<=totalSpawners; i++)
	{
		sample = (int)[aNormalDist2 getDoubleSample];
		// Move any fish that are created before ther first day to the first day
		if (sample < ([parameters getDayWithMostArrivals]-3*[parameters getSDOfArrivalDays])) 
		{
			//  if the fish is trying to arrive b4 the simulation starts force it to arrive on day 1 
			printf("!!!!!!!!!!WARNING!!!!!!!!!!\n");
			printf(">>Fish atempeted to create before day 1 of arrival window.  Moved to day 1.\n");
			sample = ([parameters getDayWithMostArrivals]-3*[parameters getSDOfArrivalDays]);
		}
		if (sample > ([parameters getDayWithMostArrivals]+3*[parameters getSDOfArrivalDays])) 
		{
			//  if the fish is trying to arrive b4 the simulation starts force it to arrive on day 1 
			printf("!!!!!!!!!!WARNING!!!!!!!!!!\n");
			printf(">>Fish atempeted to create before final day of arrival window.  Moved to final day.\n");
			sample = ([parameters getDayWithMostArrivals]+3*[parameters getSDOfArrivalDays]);
		}
		size =  [parameters getSpawnerMinLength]+([parameters getSpawnerMaxLength]-[parameters getSpawnerMinLength])*
			(([parameters getDayWithMostArrivals]+3*[parameters getSDOfArrivalDays])-sample)/
			(6*[parameters getSDOfArrivalDays]);
		//Create that spawner and add her to the list
		spawner = [Spawner createBegin: [self getZone]];
		[spawner createNewSpawnerWithSize: size ID: IDCount andParameters: parameters onDay: (int) sample];
		spawner = [spawner createEnd];
		[spawner initNewSpawner];
		[spawnerPreQueList addLast: spawner];
		IDCount++;	
	}
	return self;
}

- createEnd
{
	return self;	 
}

- initQueIDCount
{
	IDCount = 1;
	return self;
}

- stepForDay: day
{
	//printf("Que Step Start.\n");
	id <Index> spawnerIndex = nil;
	spawnerIndex = [spawnerPreQueList begin: [self getZone]];
	// Go thru the list and see if spawners should be added 
	while ([spawnerIndex next])
	{
			if([[spawnerIndex get] getDay] == [day getDay])
			{
				//  add spawners to the que 
				[spawnerQueList addLast: [spawnerIndex get]];
				[[spawnerIndex get] setQueFlag];
			}
	}
	[spawnerIndex drop];
	//Shuffel the que
	[listShuffler shuffleWholeList: spawnerQueList];
	//printf("Que Step End.\n");
	return self;
}

- getList 
{
	return spawnerQueList;
}

- getPreList 
{
	return spawnerPreQueList;
}

- resetList
{
	[spawnerQueList deleteAll];
	[aNormalDist2 drop];
	return self;
}

@end