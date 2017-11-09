#import "Tracker.h"

@implementation Tracker

-createEnd
{
	return self;
}

-initTrackerWithParameters: (Parameters *) p
{
	//Initialize Counters for summary counts
	parameters = p;
	uberReddCounter = 0;
	uberFishCounter = 0 ;
	uberSpawnedCounter = 0;
	uberGuardingCounter = 0;
	uberSuperimposedCounter = 0;
	uberSpilledEggsCounter = 0;
	uberKilledEggsCounter = 0;
	uberHatchedEggsCounter = 0;
	iterationCounter = 0;

	outputFile = fopen([parameters getOutputLocation], "w");
	fprintf(outputFile,"Day, Redds, Superimposed, Guarding, Unspawned Eggs, Killed Eggs, Hatched Eggs,Fraction Killed\n");
	fclose(outputFile);
	outputSummaryFile = fopen([parameters getSummaryLocation], "w");
	printf( "File Location: %s\n",[parameters getSummaryLocation]);
	ret=fprintf(outputSummaryFile,"Day, Redds, Superimposed, Guarding, Unspawned Eggs, Killed Eggs, Hatched Eggs,Fraction Killed\n");

	if(ret ==-1)
	{
		printf("Output file not writable. A file with its name is likely open.\n");
		printf("Press Any Key to Close.\n");  
		getchar();    
		exit(1);
	}
	
	fclose(outputSummaryFile);
	return self;
}

-updateTrackerForSpawners: que  
{
	oldFishCounter = fishCounter;
	// find how many fish are in the system
	fishCounter = [[que getList] getCount];
	return self;
}

-updateTrackerForHabitat: habitat onDay:  dayCount 
{
	//printf("Tracker Start.\n");
	double temp1;
	double temp2;
	double temp3;

	// itterate through each redd currently in the patch
	id <Index> patchIndex = nil;
	patchIndex = [[habitat getList] begin: [self getZone]];

	reddCount = 0;
	superimposedRedds = 0;
	spilledEggs = 0;
	hatchedEggs = 0;
	killedEggs = 0;
	temp1 = 0;
	temp2 = 0;
	
	while (([patchIndex next]))
	{
		reddCount = [[patchIndex get] getReddCount] + reddCount;
		superimposedRedds = [[patchIndex get] getSuperimposedRedds]+superimposedRedds;
		spilledEggs = [[patchIndex get] getSpilledEggs]+ spilledEggs;
		hatchedEggs = [[patchIndex get] getHatchedEggs]+hatchedEggs;
		killedEggs = [[patchIndex get] getKilledEggs]+killedEggs;
		temp1 = (double)([[patchIndex get] getSpilledEggs]+[[patchIndex get] getKilledEggs]+temp1);
		temp2 = (double)([[patchIndex get] getHatchedEggs]+[[patchIndex get] getSpilledEggs]+[[patchIndex get] getKilledEggs]+temp2);
	}
	
	[patchIndex drop];
	
	outputFile = fopen([parameters getOutputLocation], "a");
	fprintf(outputFile,"%d,",[dayCount getDay]);
	fprintf(outputFile,"%d,",reddCount);
	fprintf(outputFile,"%d,",superimposedRedds);
	fprintf(outputFile,"%d,",spilledEggs);
	fprintf(outputFile,"%d,",hatchedEggs);
	if (temp2 == 0)
	{
		temp3 = 0;
	}
	else
	{
		temp3 = temp1/temp2;
	}
	fprintf(outputFile,"%lf\n",temp3);
	fclose(outputFile);
	
	// Check it it's the end of a run
	if ([dayCount getDay] == [parameters getDaysPerRun])
	{
		iterationCounter = iterationCounter + 1;
		uberFishCounter = uberFishCounter + fishCounter;
		uberSuperimposedCounter = uberSuperimposedCounter + superimposedRedds;
		uberSpilledEggsCounter = uberSpilledEggsCounter + spilledEggs;
		uberReddCounter = uberReddCounter + reddCount;
		uberKilledEggsCounter = uberKilledEggsCounter + killedEggs;
		uberHatchedEggsCounter = uberHatchedEggsCounter + hatchedEggs;

		// Check if it's the end of a set of itterations
		//Print summary file if it is
		if(iterationCounter == [parameters getIterations])
		{
			outputSummaryFile = fopen([parameters getSummaryLocation], "a");
			fprintf(outputSummaryFile,"%d,",[dayCount getDay]);
			fprintf(outputSummaryFile,"%d,",uberReddCounter/[parameters getIterations]);
			fprintf(outputSummaryFile,"%d,",uberSuperimposedCounter/[parameters getIterations]);
			fprintf(outputSummaryFile,"%d,",uberGuardingCounter/[parameters getIterations]);
			fprintf(outputSummaryFile,"%d,",uberSpilledEggsCounter/[parameters getIterations]);
			fprintf(outputSummaryFile,"%d,",uberKilledEggsCounter/[parameters getIterations]);
			fprintf(outputSummaryFile,"%d,",uberHatchedEggsCounter/[parameters getIterations]);
			temp1 = (double)(uberSpilledEggsCounter+uberKilledEggsCounter);
			temp2 = (double)(uberHatchedEggsCounter+uberSpilledEggsCounter+uberKilledEggsCounter);
			temp3 = temp1/temp2;
			fprintf(outputSummaryFile,"%lf\n",temp3);
			fclose(outputSummaryFile);
			
			iterationCounter = 0;
			uberReddCounter = 0;
			uberFishCounter = 0;
			uberGuardingCounter = 0;
			uberSpilledEggsCounter = 0;
			uberKilledEggsCounter = 0;
			uberHatchedEggsCounter = 0;
			uberSuperimposedCounter = 0;
		}		
	}
	//printf("Tracker End.\n");
	return self;
}

- (int) getFishCounter
{
	return fishCounter;
}

- resetTracker
{	
	oldFishCounter = 0;
	fishCounter = 0;
	return self;
}

@end