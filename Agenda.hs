module Agenda (Persons, toPerson, insertPerson, deleteFromPersons, exportPersons, searchPerson) where

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
exportPersons ps = writeFile "OutPersons.txt" (show ps)

searchPerson :: Eq a => [a] -> a -> Bool
searchPerson ps p = elem p ps