#!/usr/bin/python
# -*- coding: utf-8 -*-
import random

class Ejercicio:

	def __init__(self, num, dif):
		self.num = num
		self.dificultad = dif
		self.preparadores = []
		self.precursor = []

	def __cmp__(self, other):
		if not isinstance(other, Ejercicio):
			return NotImplemented
		return self.num == other.num

	def __str__(self):
		return "ej" + str(self.num)

	def __repr__(self):
		return self.__str__()

def cabecera(file, nombre, ejercicios):
	file.write("(problem " + nombre + ")\n\n  (:domain ejercicios)\n")

def objetos(file, ejercicios):
	file.write("  (:objects \n")

	# Escribe ejercicios
	file.write("    ")
	for e in ejercicios:
		file.write(str(e) + " ")
	file.write("none - ejercicio\n")

	# Escribe dias
	file.write("    ")
	for i in range(15):
		file.write("d" + str(i+1) + " ")
	file.write(" - dia\n")

	file.write("  )\n")

def init(file, ejercicios, extension):
	file.write("  (:init\n")
	file.write("    (dia_actual d1)\n\n")
	file.write("    (null none)\n\n")

	# Escribe que dias son anteriores a otros
	for i in range(14):
		file.write("    (anterior d" + str(i+1) + " d" + str(i+2) + ")\n")
	file.write("\n")

	# Escribe la dificultad de los ejercicios
	for e in ejercicios:
		file.write("    (= (dificultad " + str(e) + ") " + str(e.dificultad) + ")\n")
	file.write("\n")

	if extension == 3:
		file.write("    (= (numero_ej) 0)\n\n")
	else: 
		for e in ejercicios:
			file.write("    (= (duracion " + str(e) + ") " + str(random.randrange(5, 35, 5)) + ")\n")
		file.write("\n    (= (tiempo_dia) 0)\n\n")

	# Escribe precursores
	for e in ejercicios:
		added = False
		for p in e.precursor:
			file.write("    (precursor " + str(p) + " " + str(e) + ")\n")
			added = True
		if not added: file.write("    (precursor none " + str(e) + ")\n")
	file.write("\n")

	# Escribe preparadores
	for e in ejercicios:
		for p in e.preparadores:
			file.write("    (preparador " + str(p) + " " + str(e) + ")\n")
	file.write("\n")

	file.write("  )\n")

def goal(file, ejercicios):
	file.write("  (:goal (and (dia_actual d15) ")

	for e in ejercicios:
		file.write("(= (dificultad " + str(e) + ") " + str(random.randint(e.dificultad, 10)) + ") ")
	file.write("))\n")

def main():
	nombre = input("Introduce el nombre del problema: ")
	if len(nombre) == 0:
		nombre = "problema"

	num_ejercicios = int(input("Introduce el numero de ejercicios: "))

	num_subir = int(input("Introduce el numero de ejercicios a subir de nivel [1..%d]: " % (num_ejercicios)))

	num_prec = int(input("Introduce el numero de ejercicios precursores [1..%d]: " % (num_ejercicios - 1)))
	if num_prec >= num_ejercicios:
		num_prec = num_ejercicios - 1

	num_prep = int(input("Introduce el numero de ejercicios preparadores [1..%d]: " % (num_ejercicios - 1)))
	if num_prep >= num_ejercicios:
		num_prep = num_ejercicios - 1

	ext = int(input("Introduce la extension del problema [3,4]: "))
	if ext != 3 and ext != 4:
		ext = 3

	nombre += "_ext" + str(ext)

	print ("\nGenerando el problema...")

	ejercicios = []
	for i in range(num_ejercicios):
		ejercicios.append(Ejercicio(i, random.randint(1, 10)))

	while num_prec > 0:
		r1 = r2 = -1
		while r1 == r2: 
			r1 = random.randint(0, num_ejercicios - 1)
			r2 = random.randint(0, num_ejercicios - 1)

		if len(ejercicios[r1].precursor) >= 1: continue
		ejercicios[r1].precursor.append(ejercicios[r2])
		num_prec -= 1

	while num_prep > 0:
		r1 = r2 = -1
		while r1 == r2: 
			r1 = random.randint(0, num_ejercicios - 1)
			r2 = random.randint(0, num_ejercicios - 1)

		ya_es_preparador = False
		for ej in ejercicios[r1].preparadores:
			if (ej == ejercicios[r2]):
				ya_es_preparador = True
		if ya_es_preparador: continue

		ejercicios[r1].preparadores.append(ejercicios[r2])
		num_prep -= 1

	print ("Escribiendo el problema en el archivo " + nombre + ".pddl")

	with open(nombre + ".pddl", "w") as file:
		file.write("(define ")
		cabecera(file, nombre, ejercicios)
		objetos(file, ejercicios)
		init(file, ejercicios, ext)
		goal(file, random.sample(ejercicios, num_subir))
		file.write(")\n")

	print("Listo")

if __name__ == '__main__':
	main()