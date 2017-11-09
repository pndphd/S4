ifeq ($(SWARMHOME),)
SWARMHOME=c:\swarm
endif
APPLICATION=S4SWARM
APPVERSION=2.2
BUGADDRESS=bug-swarm@swarm.org
OBJECTS=Spawner.o  main.o ModelSwarm.o Patch.o Que.o Redd.o Day.o Parameters.o Habitat.o Tracker.o ObserverSwarm.o BatchSwarm.o
include $(SWARMHOME)/etc/swarm/Makefile.appl

main.o: main.m ModelSwarm.h
ModelSwarm.o: ModelSwarm.h ModelSwarm.m
Spawner.o: Spawner.h Spawner.m
Patch.o: Patch.h Patch.m
Que.o: Que.h Que.m
Redd.o: Redd.h Redd.m
Day.o: Day.h Day.m
Parameters.o: Parameters.h Parameters.m
Habitat.o: Habitat.h Habitat.m
Tracker.o: Tracker.h Tracker.m
ObserverSwarm.o: ObserverSwarm.h ObserverSwarm.m
BatchSwarm.o: BatchSwarm.h BatchSwarm.m

