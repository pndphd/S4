 // BatchSwarm.m

#import "BatchSwarm.h"
#import "ModelSwarm.h"
#import <activity.h>
#import <simtoolsgui.h>
#import "Parameters.h"

@implementation BatchSwarm

+ createBegin: aZone
{
	BatchSwarm *obj;
 
	obj = [super createBegin: aZone];

	return obj;
}

- createEnd
{
	return [super createEnd];
}

- buildObjects
{
	[super buildObjects];
	modelSwarm = [ModelSwarm create: self];

	[modelSwarm buildObjects];

	return self;
}

- buildActions
{
	[super buildActions];

	[modelSwarm buildActions];
   
	return self;
}

- (id <Activity>)activateIn: swarmContext
{
	[super activateIn: swarmContext];

	[modelSwarm activateIn: self];

	return [self getSwarmActivity];
}

- go 
{
	printf ("Running in batch mode without graphics.\n");
	
	[[self getActivity] run];
	
	return [[self getActivity] getStatus];
}

- (void)drop
{
	[modelSwarm drop];
}

@end
