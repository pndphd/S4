#import "ReddList.h"

@implementation ReddList

- createEnd
{
	return self;
}

- initReddList
{
	reddList = [List create: [self getZone]];
	return self;
}

- getList
{
	return reddList;
}

- resetList
{
	[reddList deleteAll];
	return self;
}

- stepInPatch: patch
{
	// itterate through each redd currently in the patch
	id <Index> reddIndex = nil;
	reddIndex = [reddList begin: [self getZone]];

	while (([reddIndex next]))
	{
		[[reddIndex get] stepInPatch: patch];
	}
	
	[reddIndex drop];
	return self;
}

@end