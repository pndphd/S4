
#import "ObserverSwarm.h"
#import "ModelSwarm.h"
#import <collections.h>
#import <objectbase.h>
#import <analysis.h>
#import <gui.h>

@implementation ObserverSwarm

// createBegin: here we set up the default observation parameters.

+ createBegin: aZone
{
	ObserverSwarm *obj;
	id <CustomProbeMap> probeMap;
  
	// Superclass createBegin to allocate ourselves.
	obj = [super createBegin: aZone];

	// Fill in the relevant parameters (only one, in this case).
	obj->displayFrequency = 1;

	// Build a customized probe map
	probeMap = [CustomProbeMap create: aZone
                             forClass: [self class]
                             withIdentifiers: "displayFrequency", 
                             ":", NULL];

	// Now install our custom probeMap into the probeLibrary.
	[probeLibrary setProbeMap: probeMap For: [self class]];

	return obj;
}

- createEnd
{
	return [super createEnd];
}

- _graph1Death_ : caller
{
	[graph1 drop];
	graph1 = nil;
	return self;
}

- buildObjects
{
	int i;

	[super buildObjects];
  	modelSwarm = [ModelSwarm create: self];
	[controlPanel setStateStopped];
	[modelSwarm buildObjects];
	colormap = [Colormap create: self];
	for (i = 0; i < 64; i++)
		[colormap setColor: i ToRed: (double)i / 63.0 Green: 0 Blue: 0];
	[colormap setColor: 64 ToName: "green"];
	[colormap setColor: 65 ToName: "white"];
	return self;
}  

- _update_
{
	char title[100];
	char temp[100];
	int min;
	int max;
	if([[modelSwarm getDayCounter] getDay]==[[modelSwarm getParameters] getDaysPerRun] ||!graph1)
	{
		if([[modelSwarm getDayCounter] getDay]==[[modelSwarm getParameters] getDaysPerRun])
			[graph1 drop];

		strcpy(title, "Replicate ");
		itoa([modelSwarm getReplicate], temp, 10);
		strcat(title, temp);
		strcat(title, " of ");
		itoa([modelSwarm getReplicates], temp, 10);
		strcat(title, temp );
		strcat(title, " for value ");
		itoa([modelSwarm getIteration], temp, 10);
		strcat(title, temp);
		strcat(title, " of ");
		itoa([modelSwarm getIterations], temp, 10);
		strcat(title, temp);
			
		graph1 = [EZGraph create: self
			setTitle: title
			setAxisLabelsX: "time" Y: "fish"
			setWindowGeometryRecordName: "graph1"];
  
		[graph1 enableDestroyNotification: self
			notificationMethod: @selector (_graph1Death_:)];

		[graph1 createSequence: "fish"
			withFeedFrom: [modelSwarm getTracker]
			andSelector: M(getFishCounter)];
		
		max = [[modelSwarm getDayCounter] getTotalDays]+[[modelSwarm getParameters] getDaysPerRun];
		min = [[modelSwarm getDayCounter] getTotalDays];
		
		[graph1 setRangesXMin: min	Max: max];
	}

	if (graph1)
	{
		[graph1 step];
	}

	return self;
}

- buildActions
{
	[super buildActions];
  
	[modelSwarm buildActions];
  
	displayActions = [ActionGroup create: self];

	[displayActions createActionTo: self message: M(_update_)];

	[displayActions createActionTo: probeDisplayManager message: M(update)];

	[displayActions createActionTo: actionCache message: M(doTkEvents)];

	displaySchedule = [Schedule create: self setRepeatInterval: displayFrequency];

	[displaySchedule at: 0 createAction: displayActions];

	return self;
}  

- (id <Activity>)activateIn:  swarmContext
{

	[super activateIn: swarmContext];

	[modelSwarm activateIn: self];

	[displaySchedule activateIn: self];

	return [self getActivity];
}

@end
