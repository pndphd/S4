#import "Parameters.h"
#import "math.h"
#include <stdio.h>

@implementation Parameters

- createEnd
{
	return self;
}

- readTheParameterFile
{
	// Set up a file variables
	// File variable for main input file
	FILE *pFile;
	// File input for patch
	FILE *ppFile;

	//Open the file by name
	pFile = fopen("Example.txt", "r");

	//Begin to read and continue until end command
	while(1)
	{
		fscanf(pFile, "%s", str0);
		// Check if the text file has ended
		// and break if it has
		if(0 == strcmp("end",str0))
		{
			break;
		} 
		// Read in the the parameter that is the variable
		else if (0 == strcmp("Variable_Name", str0))
		{
			fscanf(pFile, "%s", str3);
		}
		// Read in the variable values and store in array
		else if (0 == strcmp("variableValues", str0))
		{
			for (i=0; i<= incrimentCount; i++)
			{
				fscanf(pFile, "%lf", &values[i]);
			}
		}
		// Read in the rest of the parameters
		else if (0 == strcmp("Output_Location",str0) && 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%[^\n]%*c", &outputLocation);
		}
		else if (0 == strcmp("runs",str0) && 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &incrimentCount);
		}		
		else if(0 == strcmp("Spawner_Min_Length",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &spawnerMinLength);
		}
		else if(0 == strcmp("Spawner_Max_Length",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &spawnerMaxLength);
		}
		else if(0 == strcmp("Arrival_Day_Mean",str0)&&  0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &dayWithMostArrivals);
		}
		else if(0 == strcmp("Arrival_Day_SD",str0)&&  0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &SDOfArrivalDays);
		}
		else if(0 == strcmp("Number_of_Spawners",str0)&&  0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &totalNumberOfSpawners);
		}
		else if(0 == strcmp("Temperature",str0)&&  0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &temperature);
		}
		else if(0 == strcmp("ATUs",str0)&&  0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &ATU);
		}
		else if(0 == strcmp("Redd_Area",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &reddArea);
		}
		else if(0 == strcmp("Time_Limit",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &timeLimit);
		}
		else if(0 == strcmp("Guard_Time",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &guardTime);
		}
		else if(0 == strcmp("Spawner_Fecundity_Intercept",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &fishFecundIntercept);
		}
		else if(0 == strcmp("Spawner_Fecundity_Slope",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &fishFecundSlope);
		}
		else if(0 == strcmp("Days_Per_Simulation",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &daysPerRun);
		}
		else if(0 == strcmp("Guard_Area",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &defendArea);
		}
		else if(0 == strcmp("Search_Effort",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &searchEffort);
		}
		else if(0 == strcmp("Replicates",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &iterations);
		}
		else if(0 == strcmp("Fraction_Selective",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &prefer);
		}
		else if(0 == strcmp("Number_of_Patches",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%d", &patchCount);
		}
		else if(0 == strcmp("Patch_File",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%[^\n]%*c", &patchFile);
		}
		else if(0 == strcmp("Optimum_Velocity",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &maxVelocity);
		}
		else if(0 == strcmp("Velocity_SD",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &velocitySD);
		}
		else if(0 == strcmp("Optimim_Depth",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &maxDepth);
		}
		else if(0 == strcmp("Depth_SD",str0)&& 0 != strcmp(str0,str3))
		{
			fscanf(pFile, "%lf", &depthSD);
		}
	}
	
	//format the Patch file name and remove first space
	char *temp1 = patchFile;
	temp1++;
	strcpy(patchFile,temp1);
 	ppFile = fopen(patchFile, "r");
	
	// Read in ther data from the patch file
	while(1)
	{
		fscanf(ppFile, "%s", str0);
		//printf("main 2 = %s\n", str0);
		// Check if the text file has ended
		// and break if it has
		if(0 == strcmp("end",str0))
		{
			break;
		}
		else if (0 == strcmp("Area", str0))
		{
			for (i=0; i<= patchCount; i++)
			{
				fscanf(ppFile, "%lf", &patchArea[i]);
			}
		}
		else if (0 == strcmp("Depth", str0))
		{
			for (i=0; i<= patchCount; i++)
			{
				fscanf(ppFile, "%lf", &patchDepth[i]);
			}
		}
		else if (0 == strcmp("Velocity", str0))
		{
			for (i=0; i<= patchCount; i++)
			{
				fscanf(ppFile, "%lf", &patchVelocity[i]);
			}
		}
	}
	
	// set the patch probablities
	totalProbablity = 0;
	for (i=0; i< patchCount; i++)
	{
		patchProbablity[i] = 1/sqrt(2*3.14*pow(depthSD,2))*
			exp(-pow(patchDepth[i]-maxDepth,2)/2/pow(depthSD,2))*
			1/sqrt(2*3.14*pow(velocitySD,2))*
			exp(-pow(patchVelocity[i]-maxVelocity,2)/2/pow(velocitySD,2))*patchArea[i];
		totalProbablity = totalProbablity + patchProbablity[i];
	}
	// Normalize all ther probablities
	for (i=0; i< patchCount; i++)
	{
		patchProbablity[i] = patchProbablity[i]/totalProbablity;
		//printf("probablity %lf\n", patchProbablity[i]);
	}
	
	// set up a counter to cout through the different values of ther variable
	j = 0;
	
	// Close the file
	fclose(pFile); 
	fclose(ppFile); 
	
	//make a char to hold the output location
	// get rid of first space
	char *temp = outputLocation;
	temp++;
	//put the output location in the char and attach names of output files
	strcpy(outputLocation,temp);
	strcpy(outputSummary,outputLocation);
	strcat(outputSummary,"/OutputSummary.csv");
	strcat(outputLocation,"/Output.csv");
	
	// Delete the file passed form ther GUI
	remove("temp_pass_file.txt");
	return self;
}

-initParameters
{
	// find the parameter that is this runs variable and incriment it	

	if(0 == strcmp("Spawner_Min_Length",str3))
	{
		spawnerMinLength= values[j];
	}
	else if(0 == strcmp("Spawner_Max_Length",str3))
	{
		spawnerMaxLength= values[j];
	}
	else if(0 == strcmp("Arrival_Day_Mean",str3))
	{
		dayWithMostArrivals= values[j];
	}
	else if(0 == strcmp("Arrival_Day_SD",str3))
	{
		SDOfArrivalDays= values[j];
	}
	else if(0 == strcmp("Number_of_Spawners",str3))
	{
		totalNumberOfSpawners= values[j];
	}
	else if(0 == strcmp("Temperature",str3))
	{
		temperature= values[j];
	}
	else if(0 == strcmp("ATUs",str3))
	{
		ATU= values[j];
	}
	else if(0 == strcmp("Redd_Area",str3))
	{
		reddArea= values[j];
	}
	else if(0 == strcmp("Time_Limit",str3))
	{
		timeLimit= values[j];
	}
	else if(0 == strcmp("Guard_Time",str3))
	{
		guardTime= values[j];
	}
	else if(0 == strcmp("Spawner_Fecundity_Intercept",str3))
	{
		fishFecundIntercept= values[j];
	}
	else if(0 == strcmp("Spawner_Fecundity_Slope",str3))
	{
		fishFecundSlope= values[j];
	}
	else if(0 == strcmp("Guard_Area",str3))
	{
		defendArea= values[j];
	}
	else if(0 == strcmp("Search_Effort",str3))
	{
		searchEffort= values[j];
	}
	else if(0 == strcmp("Replicates",str3))
	{
		iterations= values[j];
	}
	else if(0 == strcmp("Fraction_Selective",str3))
	{
		prefer= values[j];
	}
	
	//Calculate some parameters based on input parameters
	guardRadius = sqrt(defendArea/3.14);
	reddRadius = sqrt(reddArea/3.14);

    //Print out the parameters
	printf (">>>>>>>>>>>>>>>>>>>>Displey Input Parameters\n");
	printf ("-Patch Area of First Patch: %lf\n", patchArea[0]);
	printf ("-Output Location: %s\n", outputLocation);
	printf ("-Patch File: %s\n", patchFile);
	printf ("-Variable: %s\n", str3);
	printf ("-Number of Values: %d\n", incrimentCount);
	printf ("-Spawner min length: %lf\n",spawnerMinLength);
	printf ("-Spawner max length: %lf\n",spawnerMaxLength); 
	printf ("-Day with most arrivals: %d\n",dayWithMostArrivals); 
	printf ("-SD of arrival days: %d\n",SDOfArrivalDays); 
	printf ("-Total number of spawners: %d\n",totalNumberOfSpawners); 
	printf ("-Temperature: %lf\n",temperature); 
	printf ("-ATU: %lf\n",ATU); 
	printf ("-Redd area: %lf\n",reddArea); 
	printf ("-Defend area: %lf\n",defendArea); 
	printf ("-Time limit: %lf\n",timeLimit); 
	printf ("-Guard time: %d\n", guardTime);
	printf ("-Fish fecund intercept: %lf\n",fishFecundIntercept); 
	printf ("-Fish fecund slope: %lf\n",fishFecundSlope); 
	printf ("-Guard radius: %lf\n",guardRadius);
	printf ("-Redd radius: %lf\n",reddRadius);
	printf ("-Search effort: %d\n",searchEffort); 
	printf ("-Days per run: %d\n",daysPerRun);
	printf ("-Replicates: %d\n",iterations);
	printf ("-Prefer: %lf\n",prefer);
	
	// incriment the counter to move through the variable values
	j++;	
	return self;
}

- (int) getIncrimentCount; 
{
	return incrimentCount;
}

- (int) getPatchCount; 
{
	return patchCount;
}

- (double) getPatchProbablity: (int) k;
{
	return patchProbablity[k];
}

- (double) getPatchArea: (int) k;
{
	return patchArea[k];
}

- (double) getPatchDepth: (int) k;
{
	return patchDepth[k];
}

- (double) getPatchVelocity: (int) k;
{
	return patchVelocity[k];
}

- (double) getDepthSD;
{
	return depthSD;
}

- (double) getVelocitySD;
{
	return velocitySD;
}

- (double) getMaxDepth;
{
	return maxDepth;
}

- (double) getMaxVelocity;
{
	return maxVelocity;
}

- (double) getSpawnerMinLength; 
{
	return spawnerMinLength;
}

- (double) getSpawnerMaxLength; 
{
	return spawnerMaxLength;
}

- (int) getDayWithMostArrivals; 
{
	return dayWithMostArrivals;
}

- (int) getSDOfArrivalDays; 
{
	return SDOfArrivalDays;
}

- (int) getDaysPerRun; 
{
	return daysPerRun;
}

- (int) getTotalNumberOfSpawners; 
{
	return totalNumberOfSpawners;
}

- (double) getTemperature; 
{
	return temperature;
}

- (double) getATU; 
{
	return ATU;
}

- (double) getReddArea; 
{
	return reddArea;
}

- (double) getTimeLimit; 
{
	return timeLimit;
}

- (int) getGuardTime;
{
	return guardTime;
}

- (int) getIterations;
{
	return iterations;
}

- (double) getFishFecundIntercept; 
{
	return fishFecundIntercept;
}

- (double) getFishFecundSlope; 
{
	return fishFecundSlope;
}

- (double) getDefendArea; 
{
	return defendArea;
}

- (int) getSearchEffort;
{
	return searchEffort;
}

- (double) getGuardRadius; 
{
	return guardRadius;
}

- (double) getReddRadius; 
{
	return reddRadius;
}

- (double) getPrefer; 
{
	return prefer;
}

- (char*) getOutputLocation;
{
	return outputLocation;
}

- (char*) getSummaryLocation;
{
	return outputSummary;
}

@end