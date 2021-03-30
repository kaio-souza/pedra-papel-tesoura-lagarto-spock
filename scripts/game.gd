extends Node2D

var functions = preload("res://scripts/functions.gd")

func _process(delta):
	get_node("Placar").text = "VITÓRIAS: "+str(Global.vitorias)+"    DERROTAS: "+str(Global.derrotas)+"    EMPATES: "+str(Global.empates)

func play(choice):
	var computer_choice = functions.getComputerChoice() 
	var result =  functions.getResult(choice, computer_choice)
	get_node("ComputerCard/card").queue_free()
	get_node("PlayerCard/card").queue_free()

	get_node("PlayerCard").add_child(functions.resource[choice].instance())
	get_node("ComputerCard").add_child(functions.resource[computer_choice].instance())
	
	get_node("Options").queue_free()
	get_node("ResultText").add_child(functions.getResultResource(result))
	get_node("Vs").visible = true
	get_node("Replay").visible = true
	
func _on_Pedra_pressed():
	play(0)

func _on_Papel_pressed():
	play(1)

func _on_Tesoura_pressed():
	play(2)

func _on_Lagarto_pressed():
	play(3)

func _on_Spock_pressed():
	play(4)


func _on_Replay_pressed():
	get_tree().change_scene("res://views/game.tscn")
