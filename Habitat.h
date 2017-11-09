//  Header file for Habitate
#import "Parameters.h"
#import "Patch.h"
#import "Day.h"
#import <objectbase/SwarmObject.h>
#import "math.h"

@interface Habitat: SwarmObject

{
	id patchList;
	int i;
	id patch;

}

- initHabitat: (Parameters*) p;
- createEnd;
- stepInPatch;
- getList;
- getPatch: (int) k;




@end