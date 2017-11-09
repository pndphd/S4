#import <objectbase/SwarmObject.h>
#import "Redd.h"

@interface ReddList: SwarmObject

{
	id reddList;
}

- createEnd;
- initReddList;
- getList;
- resetList;
- stepInPatch: patch;

@end