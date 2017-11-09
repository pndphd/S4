#import "Day.h"

@implementation Day

- createEnd
{
	totalDays = 0;
	return self;
}

// Make a new day counter
- initNewDayCount
{
	day = 0;
	return self;
}

//  Add 1 to the day count 
// Total days are not reset between replicates
- step
{
	day++;
	totalDays++;
	return self;
}

- (int) getDay
{
	return day;
}

- (int) getTotalDays
{
	return totalDays;
}

@end



