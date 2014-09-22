module Main where

import System.IO
import Agenda (toPerson, insertPerson, deleteFromPersons)

main :: IO()
main = do
	hSetBuffering stdin NoBuffering
	putStr("\n\tMenu:")
	putStr("\n1-Adicionar Contato")
	putStr("\n2-Deletar Contato")
	putStr("\n3-Adicionar Lembrete")
	putStr("\n4-Deletar Lembrete")
	putStr("\n5-Exportar Contatos")
	putStr("\n6-Exportar Lembretes")
	putStr("\n7-Exportar Tudo")
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
			let agenda = insertPerson agenda person

			putStr ("Contato adicionado " ++ show name++"\n")
			main	

		|c=='2' = do
			putStr("\nDigite o nome do contato a ser deletado")
			
			name <- getLine
			name <- getLine
			putStr("\nDigite o numero do contato: ")
			tel <- getLine
			
			let person = toPerson name tel
			putStr("\nDigite o numero do contato: ")
		{-|c=='8' = do
			putStr("\nDigite o nome do arquivo")
			file <- getLine
			inpCont <- readFile file 
			contacts = parserContacts inpCont
			-}

		|c=='5' = do
			writeFile "OutContacts.txt" agenda
			main

		|c=='0' = do
			putStr("Tchau...\n")