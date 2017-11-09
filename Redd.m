#import "Redd.h"

@implementation Redd

//create a new redd with size
- createNewReddInPatch:  patch withX: (double) xCoordinate Y: (double) yCoordinate andParameters: (Parameters *) p 
{
	parameters = p;
	patchNumber = [patch getNumber];
	area = [parameters getReddArea];
	guardTime = [parameters getGuardTime];
	hatchTime = [parameters getATU]/[parameters getTemperature];
	x=xCoordinate;
	y=yCoordinate;
	return self;
}
 
- createEnd
{
	return self;	 
}

- initNewReddWithAnEggCountOf: (int) n
{
	numberOfLiveEggs = n;
	numberOfDeadEggs = 0;
	numberOfHatchedEggs = 0;
	age = 0;
	erase = NO;
	guardFlag = YES;
	superimposedFlag = NO;
	return self;
}

- stepInPatch: patch
{
	age++;
	if( age == guardTime || guardTime == 0)
	{
		guardFlag = NO;
	}
	//check if ther redd should be hatched 
	//add eggs to sucessfull eggs if true and empty redd
	if( age == hatchTime)
	{
		[patch setHatchedEggs: numberOfLiveEggs];
		numberOfLiveEggs = 0;
	}
	
	return self;
}

- killThisFractionOfEggs: (double) f
{
	numberOfDeadEggs = numberOfDeadEggs + numberOfLiveEggs*f;
	numberOfLiveEggs = numberOfLiveEggs*(1-f);
	return self;
}

- (int) getNumberOfDeadEggs
{
	return numberOfDeadEggs;
}

- (int) getNumberOfLiveEggs
{
	return numberOfLiveEggs;
}

- (int) getNumberOfHatchedEggs
{
	return numberOfHatchedEggs;
}

- (BOOL) getGuardFlag
{
	return guardFlag;
}

- (double) getX
{
	return x;
}

- (double) getY
{
	return y;
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

- setSuperimposedFlag;
{
 superimposedFlag = YES;	
 return self;
}

- (BOOL) getSuperimposedFlag;
{
	return superimposedFlag;
}

- (int) getPatchNumber
{
		return patchNumber;
}
@end