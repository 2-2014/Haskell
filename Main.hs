module Main where

import System.IO
import Agenda (Persons, toPerson, insertPerson, deleteFromPersons)

menu :: Persons -> IO()
menu persons = do
	hSetBuffering stdin NoBuffering
	putStr("\n\tMenu:")
	putStr("\n1-Adicionar Contato")
	putStr("\n2-Deletar Contato")
	putStr("\n3-Listar Contatos")
	putStr("\n4-Adicionar Lembrete")
	putStr("\n5-Deletar Lembrete")
	putStr("\n6-Exportar Contatos")
	putStr("\n7-Exportar Lembretes")
	putStr("\n8-Importar Arquivo Contatos")
	putStr("\n9-Importar Arquivo Lembretes")
	putStr("\n0-Sair")
	putStr("\n\nDigite a opcao: ")
	
	c<-getChar
	putStr("\n")
	action c

	where action c
		|c=='1' = do
			putStr("\nDigite o nome do contato: ")

			name <- getLine
			{-Nao faco ideia do porque, mas so com um
			getLine ele pula direto para o telephone-}
			name <- getLine
			putStr("\nDigite o numero do contato: ")
			tel <- getLine
			
			let person = toPerson name tel
			let agenda = insertPerson persons person

			putStr ("Contato adicionado " ++ show name++"\n")
			menu agenda

		|c=='2' = do
			putStr("\nDigite o nome do contato a ser deletado")
			
			name <- getLine
			name <- getLine
			putStr("\nDigite o numero do contato: ")
			tel <- getLine
			
			let person = toPerson name tel
			putStr("\nDigite o numero do contato: ")

		|c=='3' = do
			putStr (show persons)
			menu persons

		|c=='0' = do
			putStr("Tchau...\n")

		|otherwise = menu persons