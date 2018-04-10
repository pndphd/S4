#import <objectbase/SwarmObject.h>
#import "math.h"
#import <stdlib.h>

@interface Parameters: SwarmObject

{
	
	// Output location
	char outputLocation[200];
	char outputSummary[200];
	char patchFile[200];
	// Patch Values
	int patchCount;
	double patchArea[100] ; 
	double patchProbablity[100];
	double patchDepth[100]  ;
	double patchVelocity[100] ;
	//The Parameters List
	int incrimentCount;
	double values[100];
	//Spawner size data
	double spawnerMinLength; 
	double spawnerMaxLength; 
	int guardSpecies;
	char guardSpeciesS[5];
	//Sapwner arrival data and life span
	int dayWithMostArrivals; 
	int SDOfArrivalDays; 
	int startLifespan;
	int endLifespan;
	int totalNumberOfSpawners; 
	int daysPerRun;
	int iterations;
	//Abiotic data
	double maxVelocity;
	double velocitySD;
	double maxDepth;
	double depthSD;
	double temperature; 
	double ATU; 
	// Fish Parameters
	double reddArea; 
	double fishFecundIntercept; 
	double fishFecundSlope; 
	double defendArea;
	int searchEffort;
	double prefer;
	// Calculated things
	double guardRadius;
	double reddRadius;
	double totalProbablity;
	//Temp strings
	char str0[100], str1[100], str3[100];
	// Counters	
	int i;
	int j;
}

- createEnd;
- readTheParameterFile;
- initParameters;
- (int) getIncrimentCount; 
- (double) getMaxVelocity;
- (double) getMaxDepth;
- (double) getVelocitySD;
- (double) getDepthSD;
- (double) getSpawnerMaxLength; 
- (double) getSpawnerMinLength; 
- (int) getGuardSpecies;
- (double) getPatchDepth: (int) k;
- (double) getPatchVelocity: (int) k;
- (double) getPatchArea: (int) k;
- (double) getPatchProbablity: (int) k;
- (int) getPatchCount;
- (int) getDayWithMostArrivals; 
- (int) getSDOfArrivalDays; 
- (int) getStartLifespan;
- (int) getEndLifespan;
- (int) getDaysPerRun; 
- (int) getIterations;
- (int) getTotalNumberOfSpawners; 
- (double) getTemperature; 
- (double) getATU; 
- (double) getReddArea; 
- (double) getFishFecundIntercept; 
- (double) getFishFecundSlope; 
- (double) getDefendArea;
- (int) getSearchEffort;
- (double) getGuardRadius;
- (double) getReddRadius;
- (double) getPrefer;
- (char*) getOutputLocation;
- (char*) getSummaryLocation;

@end