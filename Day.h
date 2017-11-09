// Day headder file
#import <objectbase/SwarmObject.h>

@interface Day: SwarmObject
{
	int day;
	int totalDays;
}

//Just here to seperate creation method from others
- createEnd;
//Set a new day 
- initNewDayCount;
//Step the day
- step;
// retrive the day
- (int) getDay;
- (int) getTotalDays;

@end