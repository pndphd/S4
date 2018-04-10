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
	arrivalNormalDist = [NormalDist create: [self getZone] setGenerator: randomGenerator];
	[arrivalNormalDist setMean:[parameters getDayWithMostArrivals] setStdDev:[parameters getSDOfArrivalDays]];
	//Make another normal distribution 

	

	// Go through each spawner an get it an arrival day and length and reproductive life span
	for(i=1; i<=totalSpawners; i++)
	{

		arrivalSample = (int)[arrivalNormalDist getDoubleSample];

		// Move any fish that are created before ther first day to the first day
		if (arrivalSample < ([parameters getDayWithMostArrivals]-3*[parameters getSDOfArrivalDays])) 
		{
			 
			printf("!!!!!!!!!!WARNING!!!!!!!!!!\n");
			printf(">>Fish atempeted to create before day 1 of arrival window (6*SD arrival days).  Moved to day 1.\n");
			arrivalSample = ([parameters getDayWithMostArrivals]-3*[parameters getSDOfArrivalDays]);
		}
		if (arrivalSample > ([parameters getDayWithMostArrivals]+3*[parameters getSDOfArrivalDays])) 
		{
			
			printf("!!!!!!!!!!WARNING!!!!!!!!!!\n");
			printf(">>Fish atempeted to create before final day of arrival window (6*SD arrival days).  Moved to final day.\n");
			arrivalSample = ([parameters getDayWithMostArrivals]+3*[parameters getSDOfArrivalDays]);
		}
		if (arrivalSample < 0) 
		{
			
			printf("!!!!!!!!!!WARNING!!!!!!!!!!\n");
			printf(">>Fish atempeted to create before simulation window.  End simulation.\n");
			exit(1);
		}


		
		size =  [parameters getSpawnerMinLength]+([parameters getSpawnerMaxLength]-[parameters getSpawnerMinLength])*
			(([parameters getDayWithMostArrivals]+3*[parameters getSDOfArrivalDays])-arrivalSample)/
			(6*[parameters getSDOfArrivalDays]);
		lifespanSample = [parameters getEndLifespan]+([parameters getStartLifespan]-[parameters getEndLifespan])*
			(([parameters getDayWithMostArrivals]+3*[parameters getSDOfArrivalDays])-arrivalSample)/
			(6*[parameters getSDOfArrivalDays]);
		
		//Create that spawner and add her to the list
		spawner = [Spawner createBegin: [self getZone]];
		[spawner createNewSpawnerWithSize: size ID: IDCount andParameters: parameters onDay: (int) arrivalSample withLifespan: (int) lifespanSample];
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
	[arrivalNormalDist drop];
	return self;
}

@end