import random

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