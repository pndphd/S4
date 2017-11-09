// Habitat implementation file
#import "Habitat.h"


@implementation Habitat

- initHabitat: (Parameters*) p
{
	patchList = [List create: [self getZone]];
	[patchList deleteAll];
	for (i=0;i<[p getPatchCount];i++)
	{
		patch = [Patch createBegin: [self getZone]];
		[patch initPatchNumber: i withParameters: p];
		[patchList addLast: patch];	
	}
	
	return self;
}

-createEnd
{
	return self;
}

- stepInPatch
{
	//printf("Habitat Step Start.\n");
	id <Index> patchIndex = nil;
	patchIndex = [patchList begin: [self getZone]];
	while (([patchIndex next]))
	{
		[[patchIndex get] stepInPatch];
	}
	[patchIndex drop];
	//printf("Habitat Step End.\n");
	return self;
}

- getList
{
	return patchList;
}

- getPatch: (int) k
{
	return [patchList atOffset:k];
}

@end