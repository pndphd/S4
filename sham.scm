(list 
 (cons 'modelSwarm
       (make-instance 'ModelSwarm
						#:spawnerMeanMass 80
						#:spawnerMassSD 0
						#:spawnerMaxMass 0
						#:spawnerMinMass 0
						#:dayWithMostArrivals 100
						#:SDOfArrivalDays 20
						#:dateOfLastArrival 200
						#:totalNumberOfSpawners 1000))
	(cons 'spawner
       (make-instance 'Spawner
						#:temperatureParam 11F0
						#:ATUParam 100F0
						#:reddAreaParam 1.0F0
						#:guardTimeParam 20F0
						#:timeLimitParam 100F0
						#:fishFecundInterceptParam 666F0
						#:fishFecundSlopeParam 1.5F0)))

					  
