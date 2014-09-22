module Main where

import System.IO
import Agenda (Persons, toPerson, insertPerson, deleteFromPersons, exportPersons, searchPerson, printPersons)

menu :: Persons -> IO()
menu persons = do
	hSetBuffering stdin NoBuffering
	putStr("\n\tMenu:")
	putStr("\n1-Adicionar Contato")
	putStr("\n2-Deletar Contato")
	putStr("\n3-Listar Contatos")
	putStr("\n4-Buscar Contatos")
	putStr("\n5-Adicionar Lembrete")
	putStr("\n6-Deletar Lembrete")
	putStr("\n7-Exportar Contatos")
	putStr("\n8-Exportar Lembretes")
	putStr("\n9-Importar Arquivo Contatos")
	putStr("\n10-Importar Arquivo Lembretes")
	putStr("\n0-Sair")
	putStr("\n\nDigite a opcao: ")
	
	c<-getChar
	putStr("\n")
	action c

	where action c
		|c=='1' = do
			putStr("Digite o nome do contato: ")
			name <- getLine
			name <- getLine

			putStr("Digite o numero do contato: ")
			tel <- getLine
			
			let person = toPerson name tel
			let agenda = insertPerson persons person

			putStr ("Contato adicionado: " ++show name++"\n")
			menu agenda

		|c=='2' = do
			putStr("Digite o nome do contato a ser deletado: ")
			name <- getLine
			name <- getLine

			putStr("Digite o numero do contato: ")
			tel <- getLine
			
			let person = toPerson name tel

			let aux = deleteFromPersons persons person

			menu aux

		|c=='3' = do
			putStr ("Nome Telefone\n\n")
			putStr $ printPersons persons
			menu persons

		|c=='4' = do
			putStr("Digite o nome do contato: ")

			name <- getLine
			name <- getLine

			putStr("Digite o numero do contato: ")
 			tel <- getLine
 	 
 			let person = toPerson name tel
 	 
 			let isElem = searchPerson persons person
 			if isElem 
 			     then putStr ("Contato encontrado: " ++ show name++"\n")
 			     else do putStr ("Contato nao encontrado")

			menu persons

		
		|c=='7' = do
			exportPersons persons
			menu persons

		|c=='0' = do
			putStrLn("Fim do programa")

		|otherwise = menu persons