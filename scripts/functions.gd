extends Node

const options = [
	"Pedra",   #0
	"Papel",   #1
	"Tesoura", #2
	"Lagarto", #3
	"Spock"    #4
]
const beats = [
	[2,3], # Pedra derrota Tesoura e Lagarto
	[0,4], # Papel derrota Pedra e Spock
	[1,3], # Tesoura derrota Papel e Lagarto
	[1,4], # Lagarto derrota Papel e Spock
	[0,2], # Spock derrota Pedra e Tesoura
]

const resource = [
	preload("res://objects/pedra.tscn"), 
	preload("res://objects/papel.tscn"), 
	preload("res://objects/tesoura.tscn"), 
	preload("res://objects/lagarto.tscn"),
	preload("res://objects/spock.tscn")
]
	
static func getComputerChoice():	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(0, 4)
	return r

static func getResult(choice, computer_choice):
	if(choice == computer_choice):
		Global.empates += 1
		return 0  # DRAW GAME
	elif (beats[choice].has(computer_choice)):
		Global.vitorias += 1
		return 1  # WIN
	else:
		Global.derrotas += 1
		return 2  # LOSE


static func getResultResource(r):
	if r == 0 :
		return preload("res://objects/empate.tscn").instance()   # DRAW GAME
	elif r == 1:
		return preload("res://objects/vitoria.tscn").instance()  # WIN
	else:
		return  preload("res://objects/derrota.tscn").instance()  # LOSE
