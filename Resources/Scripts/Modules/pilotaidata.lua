-- this file contains scenario data for the pilot AI tests

newData = {
    title = "Pilot AI Test Data";
    objects = {
		[0] = {
			layer = 2;
			energy = 1000;
			shortName = "CRUISER";
			initialDirection = 0;
			iconSize = 4;
			shieldColor = 14;
			warpOutDistance = 9734400;
			spriteId = 550;
			skillNum = 3;
			portraitId = 1038;
			initialVelocityRange = 0.0;
			skillDen = 21;
			scale = 4096;
			maxVelocity = 3.5;
			buildFlags = {
				engageKey1 = false;
				engageKey2 = false;
				engageKey3 = false;
				engageKey4 = false;
				thisBaseNeedsProtection = false;
				sufficientEscortExists = false;
				canOnlyEngage = false;
				levelKey4 = false;
				hex = 0x0;
				foeDownTrend = false;
				matchingFoeExists = false;
				friendDownTrend = false;
				levelKey2 = false;
				onlyEngagedBy = false;
				uncapturedBaseExists = false;
				friendUpTrend = false;
				foeUpTrend = false;
				levelKey3 = false;
				levelKey1 = false;
			};
			damage = 0;
			weapons = {
				beam = {
					count = 2;
					positions = {
						[1] = {
							y = -10.0;
							x = 0.0;
						};
						[2] = {
							y = 10.0;
							x = 0.0;
						};
					};
					id = 39;
				};
				special = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
				pulse = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
			};
			specialDirection = 0;
			health = 650;
			warpSpeed = 40.0;
			buildTime = 1000;
			initialVelocity = 3.5;
			dangerThreshold = 0.0;
			arriveActionDistance = 50000;
			offence = 1.0;
			price = 800;
			skillNumAdj = 0;
			escortRank = 3;
			orderFlags = {
				onlyEscortNotBase = false;
				hardTargetIsNotBase = false;
				hardMatchingFoe = false;
				hex = 0x0;
				targetIsBase = false;
				hardNoFriendlyEscort = false;
				strongerThanTarget = false;
				hardTargetIsFoe = false;
				hardFriendlyEscortOnly = false;
				targetIsFoe = false;
				hardTargetIsFriend = false;
				targetIsFriend = false;
				targetIsRemote = false;
				hardTargetIsRemote = false;
				targetIsLocal = false;
				hardTargetIsBase = false;
				hardTargetIsLocal = false;
				orderKey2 = false;
				orderKey3 = false;
				orderKey1 = false;
				hardMatchingFriend = false;
				targetIsNotBase = false;
				orderKey4 = false;
			};
			initialDirectionRange = 360;
			actions = {
				activate = {
					interval = 0;
					seq = {
					};
					intervalRange = 0;
				};
				create = {
					seq = {
					};
				};
				collide = {
					seq = {
					};
				};
				expire = {
					seq = {
					};
				};
				destroy = {
					dontDieOnDeath = false;
					seq = {
						[0] = {
							velocityRelative = false;
							distanceRange = 0;
							reflexive = true;
							min = 1;
							inclusiveFilter = 0;
							directionRelative = true;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							baseType = 29;
							directOverride = -1;
							owner = 0;
							type = "create object";
							exclusiveFilter = 0;
						};
					};
				};
				arrive = {
					seq = {
					};
				};
			};
			thrust = 0.15625;
			rotation = {
				turnRate = 1.5;
				resolution = 15;
				turnAcceleration = 1.0;
				offset = 0;
			};
			initialAgeRange = 0;
			class = 200;
			name = "Cruiser";
			skillDenAdj = 0;
			notes = "Cruiser";
			initialAge = -1;
			friendDefecit = 0.0;
			staticName = "Cruiser";
			race = 200;
			mass = 0.8984375;
			attributes = {
				isHumanControlled = false;
				isPlayerShip = false;
				autoTarget = false;
				doesBounce = true;
				onAutoPilot = false;
				hasDirectionGoal = true;
				appearOnRadar = true;
				animationCycle = false;
				hideEffect = false;
				canBeHit = true;
				neutralDeath = false;
				canEvade = true;
				canBeEngaged = true;
				hated = true;
				canCollide = true;
				hex = 0x25cc9d47;
				canEngage = true;
				isRemote = false;
				canAcceptDestination = true;
				canBeDestination = true;
				releaseEnergyOnDeath = true;
				canAcceptBuild = false;
				canTurn = true;
				shapeFromDirection = true;
				isDestination = false;
				isBeam = false;
				canBeEvaded = true;
				isSelfAnimated = false;
				staticDestination = false;
				occupiesSpace = true;
				canAcceptMessages = false;
				isGuided = false;
			};
			buildRatio = 1.0;
			iconShape = "triangle";
		};	 -- 550
		[1] = {
			layer = 2;
			energy = 600;
			shortName = "FIGHTER";
			initialDirection = 0;
			iconSize = 3;
			shieldColor = 14;
			warpOutDistance = 0;
			spriteId = 551;
			skillNum = 3;
			portraitId = 0;
			initialVelocityRange = 0.0;
			skillDen = 21;
			scale = 4096;
			maxVelocity = 5.0;
			buildFlags = {
				engageKey1 = false;
				engageKey2 = false;
				engageKey3 = false;
				engageKey4 = false;
				thisBaseNeedsProtection = false;
				sufficientEscortExists = false;
				canOnlyEngage = false;
				levelKey4 = false;
				hex = 0x0;
				foeDownTrend = false;
				matchingFoeExists = false;
				friendDownTrend = false;
				levelKey2 = false;
				onlyEngagedBy = false;
				uncapturedBaseExists = false;
				friendUpTrend = false;
				foeUpTrend = false;
				levelKey3 = false;
				levelKey1 = false;
			};
			damage = 0;
			weapons = {
				beam = {
					count = 2;
					positions = {
						[1] = {
							y = -3.0;
							x = 0.0;
						};
						[2] = {
							y = 3.0;
							x = 0.0;
						};
					};
					id = 226;
				};
				special = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
				pulse = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
			};
			specialDirection = 0;
			health = 50;
			warpSpeed = 0.0;
			buildTime = 500;
			initialVelocity = 5.0;
			dangerThreshold = 1.0;
			arriveActionDistance = 50000;
			offence = 0.5;
			price = 500;
			skillNumAdj = 0;
			escortRank = 1;
			orderFlags = {
				onlyEscortNotBase = false;
				hardTargetIsNotBase = false;
				hardMatchingFoe = false;
				hex = 0x0;
				targetIsBase = false;
				hardNoFriendlyEscort = false;
				strongerThanTarget = false;
				hardTargetIsFoe = false;
				hardFriendlyEscortOnly = false;
				targetIsFoe = false;
				hardTargetIsFriend = false;
				targetIsFriend = false;
				targetIsRemote = false;
				hardTargetIsRemote = false;
				targetIsLocal = false;
				hardTargetIsBase = false;
				hardTargetIsLocal = false;
				orderKey2 = false;
				orderKey3 = false;
				orderKey1 = false;
				hardMatchingFriend = false;
				targetIsNotBase = false;
				orderKey4 = false;
			};
			initialDirectionRange = 360;
			actions = {
				activate = {
					interval = 0;
					seq = {
					};
					intervalRange = 0;
				};
				create = {
					seq = {
					};
				};
				collide = {
					seq = {
					};
				};
				expire = {
					seq = {
					};
				};
				destroy = {
					dontDieOnDeath = false;
					seq = {
						[0] = {
							velocityRelative = false;
							distanceRange = 0;
							reflexive = true;
							min = 1;
							inclusiveFilter = 0;
							directionRelative = true;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							baseType = 35;
							directOverride = -1;
							owner = 0;
							type = "create object";
							exclusiveFilter = 0;
						};
					};
				};
				arrive = {
					seq = {
					};
				};
			};
			thrust = 0.09765625;
			rotation = {
				turnRate = 3.0;
				resolution = 15;
				turnAcceleration = 1.0;
				offset = 0;
			};
			initialAgeRange = 0;
			class = 100;
			name = "Fighter";
			skillDenAdj = 0;
			notes = "Fighter";
			initialAge = -1;
			friendDefecit = 0.0;
			staticName = "Fighter";
			race = 200;
			mass = 0.5;
			attributes = {
				isHumanControlled = false;
				isPlayerShip = false;
				autoTarget = false;
				doesBounce = true;
				onAutoPilot = false;
				hasDirectionGoal = true;
				appearOnRadar = true;
				animationCycle = false;
				hideEffect = false;
				canBeHit = true;
				neutralDeath = false;
				canEvade = true;
				canBeEngaged = true;
				hated = true;
				canCollide = true;
				hex = 0x25cc9d47;
				canEngage = true;
				isRemote = false;
				canAcceptDestination = true;
				canBeDestination = true;
				releaseEnergyOnDeath = true;
				canAcceptBuild = false;
				canTurn = true;
				shapeFromDirection = true;
				isDestination = false;
				isBeam = false;
				canBeEvaded = true;
				isSelfAnimated = false;
				staticDestination = false;
				occupiesSpace = true;
				canAcceptMessages = false;
				isGuided = false;
			};
			buildRatio = 0.5;
			iconShape = "triangle";
		}; -- 551
		[2] = {
			layer = 2;
			energy = 1000;
			shortName = "GUNSHIP";
			initialDirection = 0;
			iconSize = 5;
			shieldColor = 14;
			warpOutDistance = 9734400;
			spriteId = 553;
			skillNum = 3;
			portraitId = 1065;
			initialVelocityRange = 0.0;
			skillDen = 21;
			scale = 4096;
			maxVelocity = 5.0;
			buildFlags = {
				engageKey1 = false;
				engageKey2 = false;
				engageKey3 = false;
				engageKey4 = false;
				thisBaseNeedsProtection = false;
				sufficientEscortExists = false;
				canOnlyEngage = false;
				levelKey4 = false;
				hex = 0x0;
				foeDownTrend = false;
				matchingFoeExists = false;
				friendDownTrend = false;
				levelKey2 = false;
				onlyEngagedBy = false;
				uncapturedBaseExists = false;
				friendUpTrend = false;
				foeUpTrend = false;
				levelKey3 = false;
				levelKey1 = false;
			};
			damage = 0;
			weapons = {
				beam = {
					count = 2;
					positions = {
						[1] = {
							y = -10.0;
							x = 0.0;
						};
						[2] = {
							y = 10.0;
							x = 0.0;
						};
					};
					id = 39;
				};
				special = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
				pulse = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = 65;
				};
			};
			specialDirection = 0;
			health = 650;
			warpSpeed = 40.0;
			buildTime = 2000;
			initialVelocity = 5.0;
			dangerThreshold = 0.0;
			arriveActionDistance = 50000;
			offence = 1.5;
			price = 1500;
			skillNumAdj = 0;
			escortRank = 5;
			orderFlags = {
				onlyEscortNotBase = false;
				hardTargetIsNotBase = false;
				hardMatchingFoe = false;
				hex = 0x0;
				targetIsBase = false;
				hardNoFriendlyEscort = false;
				strongerThanTarget = false;
				hardTargetIsFoe = false;
				hardFriendlyEscortOnly = false;
				targetIsFoe = false;
				hardTargetIsFriend = false;
				targetIsFriend = false;
				targetIsRemote = false;
				hardTargetIsRemote = false;
				targetIsLocal = false;
				hardTargetIsBase = false;
				hardTargetIsLocal = false;
				orderKey2 = false;
				orderKey3 = false;
				orderKey1 = false;
				hardMatchingFriend = false;
				targetIsNotBase = false;
				orderKey4 = false;
			};
			initialDirectionRange = 360;
			actions = {
				activate = {
					interval = 0;
					seq = {
					};
					intervalRange = 0;
				};
				create = {
					seq = {
					};
				};
				collide = {
					seq = {
					};
				};
				expire = {
					seq = {
					};
				};
				destroy = {
					dontDieOnDeath = false;
					seq = {
						[0] = {
							velocityRelative = false;
							distanceRange = 0;
							reflexive = true;
							min = 1;
							inclusiveFilter = 0;
							directionRelative = true;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							baseType = 29;
							directOverride = -1;
							owner = 0;
							type = "create object";
							exclusiveFilter = 0;
						};
					};
				};
				arrive = {
					seq = {
					};
				};
			};
			thrust = 0.09765625;
			rotation = {
				turnRate = 1.5;
				resolution = 15;
				turnAcceleration = 1.0;
				offset = 0;
			};
			initialAgeRange = 0;
			class = 300;
			name = "Gunship";
			skillDenAdj = 0;
			notes = "Gunship";
			initialAge = -1;
			friendDefecit = 0.0;
			staticName = "Gunship";
			race = 200;
			mass = 1.3984375;
			attributes = {
				isHumanControlled = false;
				isPlayerShip = false;
				autoTarget = false;
				doesBounce = true;
				onAutoPilot = false;
				hasDirectionGoal = true;
				appearOnRadar = true;
				animationCycle = false;
				hideEffect = false;
				canBeHit = true;
				neutralDeath = false;
				canEvade = true;
				canBeEngaged = true;
				hated = true;
				canCollide = true;
				hex = 0x25cc9d47;
				canEngage = true;
				isRemote = false;
				canAcceptDestination = true;
				canBeDestination = true;
				releaseEnergyOnDeath = true;
				canAcceptBuild = false;
				canTurn = true;
				shapeFromDirection = true;
				isDestination = false;
				isBeam = false;
				canBeEvaded = true;
				isSelfAnimated = false;
				staticDestination = false;
				occupiesSpace = true;
				canAcceptMessages = false;
				isGuided = false;
			};
			buildRatio = 0.25;
			iconShape = "triangle";
		};	 -- 553
		[3] = {
			layer = 2;
			energy = 800;
			shortName = "TRANSPRT";
			initialDirection = 0;
			iconSize = 5;
			shieldColor = 8;
			warpOutDistance = 9734400;
			spriteId = 563;
			skillNum = 3;
			portraitId = 1087;
			initialVelocityRange = 0.0;
			skillDen = 21;
			scale = 4096;
			maxVelocity = 3.0;
			buildFlags = {
				engageKey1 = false;
				engageKey2 = false;
				engageKey3 = false;
				engageKey4 = false;
				thisBaseNeedsProtection = false;
				sufficientEscortExists = true;
				canOnlyEngage = false;
				levelKey4 = false;
				hex = 0x3;
				foeDownTrend = false;
				matchingFoeExists = false;
				friendDownTrend = false;
				levelKey2 = false;
				onlyEngagedBy = false;
				uncapturedBaseExists = true;
				friendUpTrend = false;
				foeUpTrend = false;
				levelKey3 = false;
				levelKey1 = false;
			};
			damage = 0;
			weapons = {
				beam = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
				special = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
				pulse = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
			};
			specialDirection = 0;
			health = 250;
			warpSpeed = 0.0;
			buildTime = 2200;
			initialVelocity = 3.0;
			dangerThreshold = 4.0;
			arriveActionDistance = 50000;
			offence = 0.19921875;
			price = 800;
			skillNumAdj = 0;
			escortRank = 9;
			orderFlags = {
				onlyEscortNotBase = false;
				hardTargetIsNotBase = false;
				hardMatchingFoe = false;
				hex = 0xf0000083;
				targetIsBase = true;
				hardNoFriendlyEscort = false;
				strongerThanTarget = true;
				hardTargetIsFoe = false;
				hardFriendlyEscortOnly = false;
				targetIsFoe = true;
				hardTargetIsFriend = false;
				targetIsFriend = false;
				targetIsRemote = false;
				hardTargetIsRemote = false;
				targetIsLocal = false;
				hardTargetIsBase = false;
				hardTargetIsLocal = false;
				orderKey2 = true;
				orderKey3 = true;
				orderKey1 = true;
				hardMatchingFriend = false;
				targetIsNotBase = false;
				orderKey4 = true;
			};
			initialDirectionRange = 360;
			actions = {
				activate = {
					interval = 0;
					seq = {
					};
					intervalRange = 0;
				};
				create = {
					seq = {
					};
				};
				collide = {
					seq = {
					};
				};
				expire = {
					seq = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 4029677568;
							value = 0;
							delay = 0;
							subjectOverride = -1;
							useObjectsOwner = true;
							directOverride = -1;
							owner = -1;
							alterType = "owner";
							type = "alter";
							exclusiveFilter = 4294967295;
						};
					};
				};
				destroy = {
					dontDieOnDeath = false;
					seq = {
						[0] = {
							velocityRelative = false;
							distanceRange = 0;
							reflexive = true;
							min = 1;
							inclusiveFilter = 0;
							directionRelative = true;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							baseType = 29;
							directOverride = -1;
							owner = 0;
							type = "create object";
							exclusiveFilter = 0;
						};
					};
				};
				arrive = {
					seq = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 4029677568;
							speed = 32;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = -1;
							type = "land at";
							exclusiveFilter = 4294967295;
						};
						[1] = {
							volume = 255;
							priority = 5;
							isAbsolute = true;
							reflexive = false;
							soundId = 513;
							inclusiveFilter = 4029677568;
							volumeRange = 0;
							delay = 0;
							subjectOverride = -1;
							persistence = 20;
							directOverride = -1;
							owner = -1;
							type = "play sound";
							exclusiveFilter = 4294967295;
							soundRange = 0;
						};
					};
				};
			};
			thrust = 0.15625;
			rotation = {
				turnRate = 2.0;
				resolution = 15;
				turnAcceleration = 1.0;
				offset = 0;
			};
			initialAgeRange = 0;
			class = 800;
			name = "Transport";
			skillDenAdj = 0;
			notes = "Transport";
			initialAge = -1;
			friendDefecit = 2.0;
			staticName = "Transport";
			race = 200;
			mass = 1.09765625;
			attributes = {
				isHumanControlled = false;
				isPlayerShip = false;
				autoTarget = false;
				doesBounce = true;
				onAutoPilot = false;
				hasDirectionGoal = true;
				appearOnRadar = true;
				animationCycle = false;
				hideEffect = false;
				canBeHit = true;
				neutralDeath = false;
				canEvade = true;
				canBeEngaged = true;
				hated = true;
				canCollide = true;
				hex = 0x21cc9547;
				canEngage = false;
				isRemote = false;
				canAcceptDestination = true;
				canBeDestination = true;
				releaseEnergyOnDeath = true;
				canAcceptBuild = false;
				canTurn = true;
				shapeFromDirection = true;
				isDestination = false;
				isBeam = false;
				canBeEvaded = false;
				isSelfAnimated = false;
				staticDestination = false;
				occupiesSpace = true;
				canAcceptMessages = false;
				isGuided = false;
			};
			buildRatio = 0.69921875;
			iconShape = "plus";
		}; -- 563
		[4] = {
			layer = 2;
			energy = 1000;
			shortName = "MODCRSR";
			initialDirection = 0;
			iconSize = 4;
			shieldColor = 0;
			warpOutDistance = 13505625;
			spriteId = 521;
			skillNum = 3;
			portraitId = 0;
			initialVelocityRange = 0.0;
			skillDen = 21;
			scale = 4096;
			maxVelocity = 10.0;
			buildFlags = {
				engageKey1 = false;
				engageKey2 = false;
				engageKey3 = false;
				engageKey4 = false;
				thisBaseNeedsProtection = false;
				sufficientEscortExists = false;
				canOnlyEngage = false;
				levelKey4 = false;
				hex = 0x0;
				foeDownTrend = false;
				matchingFoeExists = false;
				friendDownTrend = false;
				levelKey2 = false;
				onlyEngagedBy = false;
				uncapturedBaseExists = false;
				friendUpTrend = false;
				foeUpTrend = false;
				levelKey3 = false;
				levelKey1 = false;
			};
			damage = 0;
			weapons = {
				beam = {
					count = 2;
					positions = {
						[1] = {
							y = -10.0;
							x = 0.0;
						};
						[2] = {
							y = 10.0;
							x = 0.0;
						};
					};
					id = 134;
				};
				special = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = 74;
				};
				pulse = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = 152;
				};
			};
			specialDirection = 0;
			health = 1000;
			warpSpeed = 40.0;
			buildTime = 1500;
			initialVelocity = 5.0;
			dangerThreshold = 1.0;
			arriveActionDistance = 50000;
			offence = 1.0;
			price = 1500;
			skillNumAdj = 0;
			escortRank = 3;
			orderFlags = {
				onlyEscortNotBase = false;
				hardTargetIsNotBase = false;
				hardMatchingFoe = false;
				hex = 0x0;
				targetIsBase = false;
				hardNoFriendlyEscort = false;
				strongerThanTarget = false;
				hardTargetIsFoe = false;
				hardFriendlyEscortOnly = false;
				targetIsFoe = false;
				hardTargetIsFriend = false;
				targetIsFriend = false;
				targetIsRemote = false;
				hardTargetIsRemote = false;
				targetIsLocal = false;
				hardTargetIsBase = false;
				hardTargetIsLocal = false;
				orderKey2 = false;
				orderKey3 = false;
				orderKey1 = false;
				hardMatchingFriend = false;
				targetIsNotBase = false;
				orderKey4 = false;
			};
			initialDirectionRange = 360;
			actions = {
				activate = {
					interval = 0;
					seq = {
					};
					intervalRange = 0;
				};
				create = {
					seq = {
					};
				};
				collide = {
					seq = {
					};
				};
				expire = {
					seq = {
					};
				};
				destroy = {
					dontDieOnDeath = false;
					seq = {
						[0] = {
							velocityRelative = false;
							distanceRange = 0;
							reflexive = true;
							min = 1;
							inclusiveFilter = 0;
							directionRelative = true;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							baseType = 29;
							directOverride = -1;
							owner = 0;
							type = "create object";
							exclusiveFilter = 0;
						};
					};
				};
				arrive = {
					seq = {
					};
				};
			};
			thrust = 0.15625;
			rotation = {
				turnRate = 2.0;
				resolution = 15;
				turnAcceleration = 1.0;
				offset = 0;
			};
			initialAgeRange = 0;
			class = 260;
			name = "Modified Cruiser";
			skillDenAdj = 0;
			notes = "Modified Cruiser";
			initialAge = -1;
			friendDefecit = 0.0;
			staticName = "Modified Cruiser";
			race = 100;
			mass = 1.0;
			attributes = {
				isHumanControlled = false;
				isPlayerShip = false;
				autoTarget = false;
				doesBounce = true;
				onAutoPilot = false;
				hasDirectionGoal = true;
				appearOnRadar = true;
				animationCycle = false;
				hideEffect = false;
				canBeHit = true;
				neutralDeath = false;
				canEvade = true;
				canBeEngaged = true;
				hated = true;
				canCollide = true;
				hex = 0x25cc9d47;
				canEngage = true;
				isRemote = false;
				canAcceptDestination = true;
				canBeDestination = true;
				releaseEnergyOnDeath = true;
				canAcceptBuild = false;
				canTurn = true;
				shapeFromDirection = true;
				isDestination = false;
				isBeam = false;
				canBeEvaded = true;
				isSelfAnimated = false;
				staticDestination = false;
				occupiesSpace = true;
				canAcceptMessages = false;
				isGuided = false;
			};
			buildRatio = 0.796875;
			iconShape = "triangle";
		}; -- 521
		[5] = {
			layer = 2;
			energy = 1000;
			shortName = "TRANSPRT";
			initialDirection = 0;
			iconSize = 5;
			shieldColor = 0;
			warpOutDistance = 0;
			spriteId = 515;
			skillNum = 3;
			portraitId = 0;
			initialVelocityRange = 0.0;
			skillDen = 21;
			scale = 4096;
			maxVelocity = 3.0;
			buildFlags = {
				engageKey1 = false;
				engageKey2 = false;
				engageKey3 = false;
				engageKey4 = false;
				thisBaseNeedsProtection = false;
				sufficientEscortExists = false;
				canOnlyEngage = false;
				levelKey4 = false;
				hex = 0x0;
				foeDownTrend = false;
				matchingFoeExists = false;
				friendDownTrend = false;
				levelKey2 = false;
				onlyEngagedBy = false;
				uncapturedBaseExists = false;
				friendUpTrend = false;
				foeUpTrend = false;
				levelKey3 = false;
				levelKey1 = false;
			};
			damage = 0;
			weapons = {
				beam = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
				special = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
				pulse = {
					count = 1;
					positions = {
						[1] = {
							y = 0.0;
							x = 0.0;
						};
					};
					id = -1;
				};
			};
			specialDirection = 0;
			health = 250;
			warpSpeed = 0.0;
			buildTime = 1500;
			initialVelocity = 3.0;
			dangerThreshold = 4.0;
			arriveActionDistance = 50000;
			offence = 3.0;
			price = 800;
			skillNumAdj = 0;
			escortRank = 9;
			orderFlags = {
				onlyEscortNotBase = false;
				hardTargetIsNotBase = false;
				hardMatchingFoe = false;
				hex = 0x0;
				targetIsBase = false;
				hardNoFriendlyEscort = false;
				strongerThanTarget = false;
				hardTargetIsFoe = false;
				hardFriendlyEscortOnly = false;
				targetIsFoe = false;
				hardTargetIsFriend = false;
				targetIsFriend = false;
				targetIsRemote = false;
				hardTargetIsRemote = false;
				targetIsLocal = false;
				hardTargetIsBase = false;
				hardTargetIsLocal = false;
				orderKey2 = false;
				orderKey3 = false;
				orderKey1 = false;
				hardMatchingFriend = false;
				targetIsNotBase = false;
				orderKey4 = false;
			};
			initialDirectionRange = 360;
			actions = {
				activate = {
					interval = 0;
					seq = {
					};
					intervalRange = 0;
				};
				create = {
					seq = {
					};
				};
				collide = {
					seq = {
					};
				};
				expire = {
					seq = {
					};
				};
				destroy = {
					dontDieOnDeath = false;
					seq = {
						[0] = {
							velocityRelative = false;
							distanceRange = 0;
							reflexive = true;
							min = 1;
							inclusiveFilter = 0;
							directionRelative = true;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							baseType = 29;
							directOverride = -1;
							owner = 0;
							type = "create object";
							exclusiveFilter = 0;
						};
					};
				};
				arrive = {
					seq = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 1048576;
							speed = 32;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = -1;
							type = "land at";
							exclusiveFilter = 0;
						};
						[1] = {
							volume = 255;
							priority = 5;
							isAbsolute = true;
							reflexive = false;
							soundId = 513;
							inclusiveFilter = 1048576;
							volumeRange = 0;
							delay = 0;
							subjectOverride = -1;
							persistence = 20;
							directOverride = -1;
							owner = -1;
							type = "play sound";
							exclusiveFilter = 0;
							soundRange = 0;
						};
					};
				};
			};
			thrust = 0.15625;
			rotation = {
				turnRate = 2.0;
				resolution = 15;
				turnAcceleration = 1.0;
				offset = 0;
			};
			initialAgeRange = 0;
			class = 801;
			name = "SL Transport";
			skillDenAdj = 0;
			notes = "SL Transport";
			initialAge = -1;
			friendDefecit = 3.0;
			staticName = "SL Transport";
			race = 100;
			mass = 1.19921875;
			attributes = {
				isHumanControlled = false;
				isPlayerShip = false;
				autoTarget = false;
				doesBounce = true;
				onAutoPilot = false;
				hasDirectionGoal = true;
				appearOnRadar = true;
				animationCycle = false;
				hideEffect = true;
				canBeHit = true;
				neutralDeath = false;
				canEvade = true;
				canBeEngaged = true;
				hated = true;
				canCollide = true;
				hex = 0x25ec9547;
				canEngage = false;
				isRemote = false;
				canAcceptDestination = true;
				canBeDestination = true;
				releaseEnergyOnDeath = true;
				canAcceptBuild = false;
				canTurn = true;
				shapeFromDirection = true;
				isDestination = false;
				isBeam = false;
				canBeEvaded = true;
				isSelfAnimated = false;
				staticDestination = false;
				occupiesSpace = true;
				canAcceptMessages = false;
				isGuided = false;
			};
			buildRatio = 0.09765625;
			iconShape = "plus";
		};	 -- 515
	};
    race = {
        [0] = {
            advantage = 1.0;
            singular = "Tester";
            military = "Timelord";
            homeWorld = "Gallifrey";
            plural = "Testers";
            id = 100;
        };
        [1] = {
            advantage = 3.0;
            singular = "Robot";
            military = "Cybermen";
            homeWorld = "Earth";
            plural = "Robots";
            id = 200;
        };
    };
    sprites = {
        [1024] = "Planet Bruised"; -- put this in initialObjects in the scen
        
        [550] = "Gaitori Cruiser";
        [551] = "Gaitori Fighter";
        [553] = "Gunship, Gaitori";
        [563] = "Transport, Gaitori";
        
        [521] = "Cruiser, Heavy, Ishiman";
		[515] = "Transport, Ishiman";
	};
	scenarios = {
		[1] = {
			par = {
				losses = 0;
				ratio = 0.0;
				kills = 9;
				time = 120;
			};
			angle = 5;
			playerNum = 2;
			scoreString = {
				[0] = "-Destroy all 5";
				[1] = "_-transports.";
			};
			conditions = {
				[0] = {
					direct = -1;
					actions = {
						[0] = {
							keyMask = 4177559551;
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "disable keys";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							value = 1;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "set zoom level";
							exclusiveFilter = 0;
						};
						[2] = {
							relative = false;
							reflexive = true;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = 0;
							range = 0;
							minimum = 0;
							directOverride = -1;
							owner = 0;
							alterType = "velocity";
							type = "alter";
							exclusiveFilter = 0;
						};
						[3] = {
							reflexive = false;
							inclusiveFilter = 0;
							page = 1;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "display message";
							id = 5700;
							exclusiveFilter = 0;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					value = 0;
					type = "time";
					subject = -1;
				};
				[1] = {
					screen = 4;
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							page = 3;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "display message";
							id = 5701;
							exclusiveFilter = 0;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					line = -1;
					type = "current computer selection";
					subject = -1;
				};
				[2] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 3;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
					};
					page = 3;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5701;
					subject = -1;
				};
				[3] = {
					screen = 1;
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							page = 1;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "display message";
							id = 5750;
							exclusiveFilter = 0;
						};
						[1] = {
							keyMask = 2485616640;
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "enable keys";
							exclusiveFilter = 0;
						};
						[2] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 22;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					line = -1;
					type = "current computer selection";
					subject = -1;
				};
				[4] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							value = 3;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "set zoom level";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 5;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
						[2] = {
							keyMask = 373841920;
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "enable keys";
							exclusiveFilter = 0;
						};
					};
					page = 6;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5704;
					subject = -1;
				};
				[5] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							page = 4;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "display message";
							id = 5711;
							exclusiveFilter = 0;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					value = 0;
					type = "zoom level";
					subject = -1;
				};
				[6] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = 5;
							directOverride = 0;
							owner = 0;
							type = "set destination";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 7;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
						[2] = {
							reflexive = false;
							inclusiveFilter = 0;
							value = 5;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "set zoom level";
							exclusiveFilter = 0;
						};
					};
					page = 2;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5711;
					subject = -1;
				};
				[7] = {
					direct = 5;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = 5;
							directOverride = 4;
							owner = 0;
							type = "set destination";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 120;
							subjectOverride = -1;
							range = 0;
							minimum = 8;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					location = 223.60679775;
					type = "proximity";
					subject = 0;
				};
				[8] = {
					direct = 5;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = 5;
							directOverride = 0;
							owner = 0;
							type = "set destination";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 120;
							subjectOverride = -1;
							range = 0;
							minimum = 7;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					location = 223.60679775;
					type = "proximity";
					subject = 4;
				};
				[9] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = true;
							how = "plain";
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = 5;
							directOverride = -1;
							owner = 0;
							type = "die";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 10;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
					};
					page = 4;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5711;
					subject = -1;
				};
				[10] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = true;
							inclusiveFilter = 0;
							page = 6;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "display message";
							id = 5715;
							exclusiveFilter = 0;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					value = 7;
					type = "zoom level";
					subject = -1;
				};
				[11] = {
					direct = -1;
					actions = {
						[0] = {
							keyMask = 2828558336;
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "disable keys";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							value = 7;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "set zoom level";
							exclusiveFilter = 0;
						};
					};
					page = 1;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5715;
					subject = -1;
				};
				[12] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = true;
							inclusiveFilter = 0;
							value = -249;
							delay = 0;
							subjectOverride = 2;
							directOverride = -1;
							owner = 0;
							alterType = "health";
							type = "alter";
							exclusiveFilter = 0;
						};
					};
					page = 3;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5715;
					subject = -1;
				};
				[13] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 14;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
						[1] = {
							keyMask = 374890496;
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "enable keys";
							exclusiveFilter = 0;
						};
					};
					page = 6;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5715;
					subject = -1;
				};
				[14] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							page = 21;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "display message";
							id = 5721;
							exclusiveFilter = 0;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					value = 1;
					type = "zoom level";
					subject = -1;
				};
				[15] = {
					direct = -1;
					actions = {
						[0] = {
							keyMask = 12582924;
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "enable keys";
							exclusiveFilter = 0;
						};
					};
					page = 2;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5721;
					subject = -1;
				};
				[16] = {
					direct = -1;
					actions = {
						[0] = {
							keyMask = 131;
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "enable keys";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							value = 1;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "set zoom level";
							exclusiveFilter = 0;
						};
					};
					page = 4;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5721;
					subject = -1;
				};
				[17] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							value = 4;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "set zoom level";
							exclusiveFilter = 0;
						};
					};
					page = 3;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5721;
					subject = -1;
				};
				[18] = {
					direct = -1;
					actions = {
						[0] = {
							keyMask = 112;
							reflexive = true;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "enable keys";
							exclusiveFilter = 0;
						};
					};
					page = 11;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5721;
					subject = -1;
				};
				[19] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 1;
							minimum = 7;
							directOverride = -1;
							owner = 0;
							alterType = "hidden";
							type = "alter";
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = true;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = 8;
							directOverride = -1;
							owner = 0;
							alterType = "cloak";
							type = "alter";
							exclusiveFilter = 0;
						};
						[2] = {
							reflexive = true;
							inclusiveFilter = 0;
							value = 0;
							delay = 0;
							subjectOverride = 8;
							directOverride = -1;
							owner = 0;
							alterType = "max velocity";
							type = "alter";
							exclusiveFilter = 0;
						};
						[3] = {
							reflexive = true;
							inclusiveFilter = 0;
							value = 0;
							delay = 0;
							subjectOverride = 7;
							directOverride = -1;
							owner = 0;
							alterType = "max velocity";
							type = "alter";
							exclusiveFilter = 0;
						};
						[4] = {
							reflexive = true;
							inclusiveFilter = 0;
							value = 0;
							delay = 0;
							subjectOverride = 4;
							useObjectsOwner = false;
							directOverride = -1;
							owner = 0;
							alterType = "owner";
							type = "alter";
							exclusiveFilter = 0;
						};
						[5] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 20;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
					};
					page = 17;
					flags = {
						hasBeenTrue = false;
						hex = 0x1;
						initiallyTrue = false;
						trueOnlyOnce = true;
					};
					type = "current message";
					id = 5721;
					subject = -1;
				};
				[20] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 21;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					value = 7;
					type = "destruction";
					subject = -1;
				};
				[21] = {
					direct = -1;
					actions = {
						[0] = {
							reflexive = true;
							player = 0;
							inclusiveFilter = 0;
							text = 7050;
							nextLevel = 2;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "declare winner";
							exclusiveFilter = 0;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					value = 8;
					type = "destruction";
					subject = -1;
				};
				[22] = {
					screen = 1;
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							page = 1;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "display message";
							id = 5751;
							exclusiveFilter = 0;
						};
						[1] = {
							reflexive = false;
							inclusiveFilter = 0;
							delay = 0;
							subjectOverride = -1;
							range = 0;
							minimum = 23;
							directOverride = -1;
							owner = 0;
							alterType = "active condition";
							type = "alter";
							exclusiveFilter = 0;
							conditionTrue = false;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					line = 3;
					type = "current computer selection";
					subject = -1;
				};
				[23] = {
					screen = 4;
					direct = -1;
					actions = {
						[0] = {
							reflexive = false;
							inclusiveFilter = 0;
							page = 7;
							delay = 0;
							subjectOverride = -1;
							directOverride = -1;
							owner = 0;
							type = "display message";
							id = 5704;
							exclusiveFilter = 0;
						};
					};
					flags = {
						hasBeenTrue = false;
						hex = 0x3;
						initiallyTrue = true;
						trueOnlyOnce = true;
					};
					line = -1;
					type = "current computer selection";
					subject = -1;
				};
			};
			initialObjects = {
				[0] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = -1;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = false;
						isPlayerShip = true;
						fixedRace = false;
						hex = 0x200;
						initiallyHidden = false;
					};
					owner = 0;
					position = {
						y = 0;
						x = 0;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 0;
					earning = 0.0;
				};
				[1] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = -1;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = false;
						isPlayerShip = false;
						fixedRace = false;
						hex = 0x0;
						initiallyHidden = false;
					};
					owner = 0;
					position = {
						y = 3000;
						x = -3000;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 0;
					earning = 0.0;
				};
				[2] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = -1;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = false;
						isPlayerShip = false;
						fixedRace = false;
						hex = 0x0;
						initiallyHidden = false;
					};
					owner = 0;
					position = {
						y = 3000;
						x = 0;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 24;
					earning = 0.0;
				};
				[3] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = -1;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = false;
						isPlayerShip = false;
						fixedRace = false;
						hex = 0x0;
						initiallyHidden = false;
					};
					owner = 0;
					position = {
						y = 3000;
						x = 3000;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 47;
					earning = 0.0;
				};
				[4] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = -1;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = false;
						isPlayerShip = false;
						fixedRace = false;
						hex = 0x0;
						initiallyHidden = false;
					};
					owner = -1;
					position = {
						y = 0;
						x = 5000;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 23;
					earning = 0.0;
				};
				[5] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = -1;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = true;
						isPlayerShip = false;
						fixedRace = true;
						hex = 0x2000010;
						initiallyHidden = false;
					};
					owner = 1;
					position = {
						y = -1000;
						x = 3000;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 287;
					earning = 0.0;
				};
				[6] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = -1;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = false;
						isPlayerShip = false;
						fixedRace = false;
						hex = 0x20;
						initiallyHidden = true;
					};
					owner = 0;
					position = {
						y = 3000;
						x = 3000;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 0;
					earning = 0.0;
				};
				[7] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = 7;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = true;
						isPlayerShip = false;
						fixedRace = false;
						hex = 0x2000020;
						initiallyHidden = true;
					};
					owner = 1;
					position = {
						y = -6000;
						x = 3000;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 25;
					earning = 0.0;
				};
				[8] = {
					distanceRange = 0;
					builds = {
					};
					initialDestination = 8;
					spriteIdOverride = -1;
					attributes = {
						staticDestination = true;
						isPlayerShip = false;
						fixedRace = false;
						hex = 0x2000020;
						initiallyHidden = true;
					};
					owner = 1;
					position = {
						y = -6250;
						x = 3250;
					};
					rotation = {
						range = 0;
						minumum = 0;
					};
					type = 25;
					earning = 0.0;
				};
			};
			isTraining = false;
			startTime = 0;
			name = "\\i Tutorial Lesson 1\n\\iMoons for Goons";
			players = {
				[1] = {
					netRaceFlags = 0;
					earningPower = 0.0078125;
					race = 100;
					type = "single";
					name = "The Human/Ishiman Cooperative";
				};
				[2] = {
					netRaceFlags = 0;
					earningPower = 1.0;
					race = 200;
					type = "cpu";
					name = "The Cantharan Order";
				};
			};
			netRaceFlags = 0;
			songId = 4002;
			prologue = "#+B2005\n\i PROLOGUE \n\i \n#+\nThe Ishimans broadcast their plans to your crew -- your crew, once explorers, now reluctant warriors.\n\nUsing their massive gateship, your new alien allies will transport the UNS Ares and its crew to strategic points along the winding route to Earth. With its jumpstream technology, the gateship can bridge great distances in an instant.  Were it not for the war, you would be home in weeks.\n\nYou will be supplied with ships and, when possible, bases of operation. The Ishimans will provide you with tactical plans, but it will be up to you to execute them successfully.\n\nYou have a vast expanse of space to cross, and it is filled with unknowable dangers.\n\nBut first, you must prepare...";
			briefing = {
			};
			movie = nil;
			epilogue = "";
			id = 1;
			starmap = {
				y = 287;
				x = 330;
			};
		};
	};
	sounds = {
		[510] = "ZoomChange";
		[511] = "NaughtyBeep";
	};