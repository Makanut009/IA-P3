#!/usr/bin/python
# -*- coding: utf-8 -*-
import random;

class Exercice:

	def __init__(self, num, level):
		self.preparer = []
		self.precursor = []
		self.num = num
		self.level = level

	def __cmp__(self, other):
		if not isinstance(other, Exercice):
			return NotImplemented
		return self.num == other.num

	def __str__(self):
		return "Ex" + str(self.num)

	def __repr__(self):
		return self.__str__()

def writeHeaders(file, name, exercices):
	file.write("  (problem " + name + ")\n  (:domain exercices)\n")

def writeObjects(file, exercices):
	file.write("  (:objects \n")

	# Write exercices
	file.write("    ")
	for e in exercices:
		file.write(str(e) + " ")
	file.write("none - exercice\n")

	# Write days
	file.write("    ")
	for i in range(15):
		file.write("d" + str(i+1) + " ")
	file.write(" - day\n")

	file.write("  )\n")

def writeInit(file, exercices, extension):
	file.write("  (:init\n")
	file.write("    (currentDay d1)\n\n")
	file.write("    (null none)\n\n")

	# Write days
	for i in range(14):
		file.write("    (before d" + str(i+1) + " d" + str(i+2) + ")\n")
	file.write("\n")

	# Write exercices' level
	for e in exercices:
		file.write("    (= (exLevel " + str(e) + ") " + str(e.level) + ")\n")
	file.write("\n")

	if extension == 3:
		file.write("    (= (numExToday) 0)\n\n")
	else: 
		for e in exercices:
			file.write("    (= (exTime " + str(e) + ") " + str(random.randrange(5, 35, 5)) + ")\n")
		file.write("\n    (= (timeDay) 0)\n\n")

	# Write precursors
	for e in exercices:
		added = False
		for p in e.precursor:
			file.write("    (precursor " + str(p) + " " + str(e) + ")\n")
			added = True
		if not added: file.write("    (precursor none " + str(e) + ")\n")
	file.write("\n")

	# Write preparers
	for e in exercices:
		for p in e.preparer:
			file.write("    (preparer " + str(p) + " " + str(e) + ")\n")
	file.write("\n")

	file.write("  )\n")

def writeGoal(file, sample):
	file.write("  (:goal (and (currentDay d15) ")

	for e in sample:
		file.write("(= (exLevel " + str(e) + ") " + str(random.randint(e.level, 10)) + ") ")
	file.write("))\n")

def main():
	name = raw_input("Nombre del problema (default = ExerciceN): ")
	if len(name) == 0:
		name = "ExerciceN"

	# Use the try catch behaviour to check if the user entered a number or only ENTER
	try:
		numExercices = int(raw_input("Quantos ejercicios quieres (default = 15)? "))
	except ValueError:
		numExercices = 15

	try:
		numFinal = int(raw_input("Quantos ejercicios quieres subir al nivel 10 (default = %d, maximo = %d)? " % (numExercices/4, numExercices)))
	except ValueError:
		numFinal = numExercices/4

	try:
		numPrecursor = int(raw_input("Quantos precursores quieres (default = %d, maximo = %d)? " % (numExercices/3, numExercices - 1)))
		if numPrecursor >= numExercices:
			numPrecursor -= 1
	except ValueError:
		numPrecursor = numExercices/3

	try:
		numPreparer = int(raw_input("Quantos preparadores quieres (default = %d, maximo = %d)? " % (numExercices/3, numExercices - 1)))
		if numPreparer >= numExercices:
			numPreparer -= 1
	except ValueError:
		numPreparer = numExercices/3

	try:
		extension = int(raw_input("Que extension quieres cumplir? [3,4] (default 3) "))
		if extension != 3 and extension != 4:
			extension = 3
	except ValueError:
		extension = 3

	#Add extension to name
	name += "_" + str(extension)

	print "\nGracias! Estamos generando el problema, por favor espera."

	exercices = []
	for i in range(numExercices):
		# Create exercices with a random level
		exercices.append(Exercice(i, random.randint(1, 10)))

	while numPrecursor > 0:
		r = random.randint(0, numExercices - 2)

		# Check that a exercice can only have one precursor
		if (len(exercices[r].precursor) >= 1): continue
		exercices[r].precursor.append(exercices[r + 1])
		numPrecursor -= 1

	while numPreparer > 0:
		r1 = random.randint(0, numExercices - 2)
		r2 = random.randint(1, numExercices - r1 - 1)

		# Check that this preparer is not already added
		alreadyAdded = False
		for e in exercices[r1].preparer:
			if (exercices[r1 + r2] == e):
				alreadyAdded = True
		if alreadyAdded:
			continue
				
		# Add the preparer exercice
		exercices[r1].preparer.append(exercices[r1 + r2])
		numPreparer -= 1

	print "Escribiendo el problema en el arxivo " + name + ".pddl"
	with open(name + ".pddl", "w") as file:
		file.write("(define\n")
		writeHeaders(file, name, exercices)
		writeObjects(file, exercices)
		writeInit(file, exercices, extension)
		writeGoal(file, random.sample(exercices, numFinal))
		file.write(")\n")
	print "Finalizado!"

if __name__ == '__main__':
	main()