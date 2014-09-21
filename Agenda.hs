module Agenda () where

import Data.Time

type Name = String
type Number = String
type Date = Day
type Contacts = [(Name, Number)]
type Reminder = [(Date, String)]

agenda :: Agenda
agenda=[()]

insertAgenda :: Agenda -> Name -> Number -> Agenda
insertAgenda [] n t = [(n, t)]
insertAgenda a n t = a++[(n, t)]

deleteFromAgenda :: Agenda -> Name -> Agenda
deleteFromAgenda [] n = [()]
deleteFromAgenda a n
	|