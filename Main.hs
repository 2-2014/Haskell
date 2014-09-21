module Main where

import System.IO
import Agenda

main :: IO()
main = do
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
	putStr("\n\nDigite a opcao: ")
	
	c<-getChar
	putStr("\n")
	action c

	where action c
		|c=='1' = do
			putStr("\nDigite o nome do contato")
			n<-getLine
			putStr("\nDigite o numero do contato")
			t <- getLine
			insertAgenda agenda n t
		{-|c=='8' = do
			putStr("\nDigite o nome do arquivo")
			file <- getLine
			inpCont <- readFile file 
			contacts = parserContacts inpCont
			-}