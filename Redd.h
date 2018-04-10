
#import <objectbase/SwarmObject.h>
#import "Parameters.h"
#import "Patch.h"

@interface Redd: SwarmObject
{
	Parameters * parameters;
	//Fixed Values
	double area;
	int hatchTime;
	int guardTime;

	//Trackers
	int numberOfLiveEggs;
	int numberOfDeadEggs;
	int numberOfHatchedEggs;
	int patchNumber;
	int age;
	// BOOLs for the state of the redd
	BOOL superimposedFlag;
	BOOL guardFlag;
	BOOL erase;
	//Coordinates 
	double x, y;
}

//create a new redd with size
- createNewReddInPatch: patch withX: (double) xCoordinate Y: (double) yCoordinate parameters: (Parameters *) parameters andGuardTime: (int) g;
//Just here to seperate creation method from others
- createEnd;
//initalize the new redd
- initNewReddWithAnEggCountOf:(int) n;
- stepInPatch: patch;
//Kill a precent of eggs
- killThisFractionOfEggs:(double) f;
// get the number of dead eggs in this redd
- (int) getNumberOfDeadEggs;
// get the number of live eggs in this redd
- (int) getNumberOfLiveEggs;
// get the number of eggs that successfully made it out
- (int) getNumberOfHatchedEggs;
- (BOOL) getGuardFlag;
- (double) getX;
- (double) getY;
- setEraseFlag;
- setSuperimposedFlag;
- (BOOL) getSuperimposedFlag;
- (BOOL) getEraseFlag;

@end 
 
 