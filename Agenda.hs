module Agenda (Persons, toContact, insertContact, deleteFromContacts, toPerson, insertPerson, deleteFromPersons) where

import System.IO
import Data.List(delete)

type Contact = (String, String)
type Agenda = [Contact]

data Person = Person{ name :: String
					, telephone :: String
					}deriving(Show, Eq)

type Persons = [Person]

toContact :: String -> String -> Contact
toContact name tel = (name, tel)

insertContact :: Agenda -> Contact -> Agenda
insertContact [] c = c:[]
insertContact a c = c:a

deleteFromContacts :: Agenda -> Contact -> Agenda
deleteFromContacts [] c = []
deleteFromContacts a c = delete c a


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
