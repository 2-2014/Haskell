module Main where

import System.IO

import Agenda 
       ( Persons
       , toPerson
       , insertPerson
       , deleteFromPersons
       , exportPersons
       , searchPerson
       , printPersons
       )

menu :: Persons -> IO()
menu persons = do
	hSetBuffering stdin NoBuffering
	putStrLn("\n -----------------------------------")
	putStrLn("|\t\tMENU                |")
	putStrLn("|-----------------------------------|")
	putStrLn("| 1-Adicionar Contato               |")
	putStrLn("| 2-Deletar Contato                 |")
	putStrLn("| 3-Listar Contatos                 |")
	putStrLn("| 4-Buscar Contatos                 |")
	putStrLn("| 5-Exportar Arquivo com Contatos   |")
	putStrLn("| 6-Importar Arquivo com Contatos   |")
	putStrLn("| 0-Sair                            |")
	putStrLn(" -----------------------------------")
	putStr("\nDigite a opcao: ")
	
	c <- getChar
	putStr "\n"
	action c

	where action c
		|c == '1' = do
			putStr("Digite o nome do contato: ")
			name <- getLine
			name <- getLine

			putStr("Digite o numero do contato: ")
      			tel <- getLine
			
			let person = toPerson name tel
			let agenda = insertPerson persons person

			putStr ("Contato adicionado: " ++show name++ "\n")
		        menu agenda

		|c == '2' = do

			putStr("Digite o nome do contato a ser deletado: ")
			name <- getLine
			name <- getLine

			putStr("Digite o numero do contato: ")
			tel <- getLine
			
			let person = toPerson name tel

			let aux = deleteFromPersons persons person

			menu aux

		|c=='3' = do
			putStr ("Nome\tTelefone\n")
			putStr $ printPersons persons

			menu persons

		|c == '4' = do
			putStr("Digite o nome do contato: ")

   			name <- getLine
			name <- getLine

			putStr("Digite o numero do contato: ")
 			tel <- getLine
 	 
 			let person = toPerson name tel
 	 
 		        let isElem = searchPerson persons person
 			if isElem 
 				then putStr ("Contato encontrado: " ++ show name++"\n")
 				else do putStrLn ("Contato nao encontrado")

			menu persons

		
		|c == '5' = do
			exportPersons persons
			menu persons

		|c == '0' = do
			putStrLn ("Fim do programa")

		|otherwise = menu persons