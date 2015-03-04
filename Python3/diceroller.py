import random

rseed = random.randint(1, 10000) # in a full implementation this be replaced with a prompt for the user, or the system to pull a true random seed value from random.org
random.seed(rseed) # seed pseudo random number generator


dice = 2
numberOfSides = 6
diceTotal = 0

results = []

for die in range(dice):
	dieValue = random.randint(1,numberOfSides)
	results.append(dieValue)
	diceTotal += dieValue

print(results)
print(diceTotal)