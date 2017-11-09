#import "ModelSwarm.h"

@implementation ModelSwarm

// Create the zone to contatin the swarm
+ createBegin: aZone
{
	ModelSwarm *obj;
	obj = [super createBegin: aZone];
	return obj;
}

- createEnd
{
	return [super createEnd];
}

- buildObjects
{
	//Load the input parameters for ther model 
	parameters = [Parameters createBegin: [self getZone]];
	parameters = [parameters createEnd];
	[parameters readTheParameterFile];
	[parameters initParameters];
	
	printf(">>>>>>>>>>>>>>>>>>>>Bulid Days Object\n");
	//Create the day counter
	day = [Day createBegin: [self getZone]];
	day = [day createEnd];
	[day initNewDayCount];
	
	printf(">>>>>>>>>>>>>>>>>>>>Bulid Patche\n");
	//Create the spawning area
	habitat = [Habitat createBegin: [self getZone]];
	[habitat initHabitat: parameters];
	habitat = [habitat createEnd];
		
	printf(">>>>>>>>>>>>>>>>>>>>Bulid Que\n");
	//Create the que
	que = [Que createBegin: [self getZone]];
	[que createQueList];
	[que setQueDistributionWithParameters: parameters];
	que = [que createEnd];
	[que initQueIDCount];
	
	printf(">>>>>>>>>>>>>>>>>>>>Bulid Tracker\n");
	//Create the tracker which tracks the outputs of the program
	tracker = [Tracker createBegin: [self getZone]];
	tracker = [tracker createEnd];
	[tracker initTrackerWithParameters: parameters];
	
	// Create ques in which to place objects to be deleted
	reaperQue = [List create: self];
	reaperPreQue = [List create: self];
	reaperReddQue = [List create: self];
	
	// initalize counts
	replicate = 1;
	iteration = 1;

	printf(">>>>>>>>>>>>>>>>>>>>Start Run\n");
	return self;
}

- buildActions
{	
	printf(">>>>>>>>>>>>>>>>>>>>Bulid Actions\n");
	[super buildActions];
	modelActions = [ActionGroup create: [self getZone]];
	//Step by one day
	[modelActions createActionTo: day message: M(step)];
	//Add the spawners for that day and  
	[modelActions createActionTo: que message: M(stepForDay:): day];
	//Have each spawner assess ther habitat and spawn if possible
	[modelActions createActionForEach: [que getList]
		message: M(stepInHabitat:) :habitat];
	//Age each redd by a day
	[modelActions createActionTo: habitat message: M(stepInPatch)];
	//Put results in the tracker for reporting 
	[modelActions createActionTo: tracker message: M(updateTrackerForSpawners:):que];
	[modelActions createActionTo: tracker message: M(updateTrackerForHabitat:onDay:):habitat:day];
	//Delete all individuals who need to be
	[modelActions createActionTo: self message: M(mark)];
	[modelActions createActionTo: self message: M(clean)];
	//Check if you are at the end of a replicate or a run
	[modelActions createActionTo: self message: M(checkToReset)];
	
	modelSchedule = [Schedule createBegin: [self getZone]];
	[modelSchedule setRepeatInterval: 1];
	modelSchedule = [modelSchedule createEnd];
	[modelSchedule at: 0 createAction: modelActions];
	//printf(">>>>>>>>>>>>>>>>>>>>Finsih Bulid Actions\n");

	return self;
}

- (id <Activity>)activateIn: swarmContext
{
	// Activate the swarm 
	[super activateIn: swarmContext];
 	[modelSchedule activateIn: self];
	return [self getActivity];
}

// Mark objects to be deleted
- mark
{	
	//printf("Mark Start.\n");
	//Find spawners in the que to be deleted
	id <Index> spawnerIndex = nil;
	spawnerIndex = [[que getList] begin: [self getZone]];
	while (([spawnerIndex next]))
	{
		if ([[spawnerIndex get] getEraseFlag]==YES)
		{	
			[reaperQue addLast: [spawnerIndex get]];
		}
	}
	[spawnerIndex drop];
	
	//Find spawners in the pre que to be deleted (they have already entered the system)
	id <Index> spawnerIndex2 = nil;
	spawnerIndex2 = [[que getPreList] begin: [self getZone]];
	while (([spawnerIndex2 next]))
	{
		if ([[spawnerIndex2 get] getQueFlag]==YES)
		{	
			[reaperPreQue addLast: [spawnerIndex2 get]];
		}
	}
	[spawnerIndex2 drop];
	
	//printf("Mark End.\n");
	return self;
}

// Delete those objects
- clean
{
	//printf("Clean Start.\n");
	id index, agent;
    index = [reaperQue begin: self];
	while ((agent = [index next]))
		{
			[[que getList] remove: agent];
			[agent drop];
		}
	[reaperQue removeAll];
	[index drop];

	index = [reaperPreQue begin: self];
	while ((agent = [index next]))
		{
			[[que getPreList] remove: agent];
		}
	[reaperPreQue removeAll];
	[index drop];

	//printf("Clean End.\n");
	return self;
}

- checkToReset
{	
	//printf("Reset Start.\n");
	// if the day count has passes the days per run reset for next run
	if ([day getDay] > [parameters getDaysPerRun])
	{   
		replicate++;
		totalDays += [parameters getDaysPerRun];	
		
		//If all runs are complete end the program
		if (totalDays == [parameters getDaysPerRun]*[parameters getIncrimentCount]*[parameters getIterations])
		{
			printf ("***Run Complete***\n");
			_Exit(0);
		}
		// if you've complete all ther replicates and it's time for the next parameter set
		if ((totalDays % ([parameters getDaysPerRun]*[parameters getIterations])) == 0)
		{
			[parameters initParameters];
			replicate = 1;
			iteration++;
		}			

		[day initNewDayCount];
		[habitat initHabitat: parameters];
		[que resetList];
		[que setQueDistributionWithParameters: parameters];
		[que initQueIDCount];
		[tracker resetTracker];
		
		printf("Itteration %d of %d. Value %d of %d.\n",
			replicate,[parameters getIterations],iteration,[parameters getIncrimentCount]);
	}
	
	//printf("Reset End.\n");
	return self;
}

- getTracker
{
	return tracker;
}

- getDayCounter
{
	return day;
}

- getParameters
{
	return parameters;
}

- (int) getReplicate
{
	return replicate;
}

- (int) getReplicates
{
	int temp;
	temp = [parameters getIterations];
	return temp;
}

- (int) getIteration
{
	return iteration;
}

- (int) getIterations
{
	int temp;
	temp = [parameters getIncrimentCount];
	return temp;
}

@end

