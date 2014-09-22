module Agenda (Persons, toPerson, insertPerson, deleteFromPersons, exportPersons, searchPerson, printNamePerson, printTelPerson, printPerson, printPersons) where

import System.IO
import Data.List(delete)

data Person = Person{ name :: String
					, telephone :: String
					}deriving(Show, Eq)

type Persons = [Person]

toPerson :: String -> String -> Person
toPerson n t = Person{name = n, telephone = t} 

insertPerson :: Persons -> Person -> Persons
insertPerson [] p = p:[]
insertPerson ps p = p:ps

deleteFromPersons :: Persons -> Person -> Persons
deleteFromPersons [] p = []
deleteFromPersons ps p = delete p ps

exportPersons :: Persons -> IO()
exportPersons ps = writeFile "OutPersons.txt" (printPersons ps)

searchPerson :: Eq a => [a] -> a -> Bool
searchPerson ps p = elem p ps

printNamePerson :: Person -> String
printNamePerson p = name p

printTelPerson :: Person -> String
printTelPerson p = telephone p

printPerson :: Person -> String
printPerson p = printNamePerson p ++ " " ++ printTelPerson p

printPersons :: Persons -> String
printPersons [] = ""
printPersons (h:t) = printPerson h ++ "\n" ++ printPersons t

{- parse error on input ‘if’

importPersons :: Handler -> Persons -> Persons
importPersons inh p = 
	do ineof <- hIsEOF inh
		if ineof
			then return ps
			else do name <- hGetLine inh
					tel <- hGetLine inh
					ps = insertPerson inpStr
					importPersons inh ps
-}