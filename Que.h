#import <objectbase/SwarmObject.h>
#import <random.h>
#import "Spawner.h"
#import "Day.h"
#import "Parameters.h"

@interface Que: SwarmObject

{
	Parameters * param;
	int totalSpawners;
	int IDCount;
	id spawner;
	id spawnerQueList;
	id spawnerPreQueList;
	id listShuffler;
	id <NormalDist> arrivalNormalDist;

	double size;
	int arrivalSample;
	int lifespanSample;
	int i;
}

- createQueList;
//Set the parameters of the que
- setQueDistributionWithParameters: (Parameters *) parameters; 
//Just here to seperate creation method from others
- createEnd;
- initQueIDCount;
//Get the number form the que
- stepForDay: day;
- getList;
- getPreList;
- resetList;

@end
