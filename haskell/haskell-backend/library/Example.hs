-- | An example module.
module Example where

import Types

d1 :: Department
d1 = Department "Sausage" "Sausage Firm" "Handles Sausages"

e1 :: Employee
e1 = Employee "Sven" "Svensen" "Sven@Svensen.dk" d1

e2 :: Employee
e2 = Employee "Lars" "Larsen" "Lars@Larsen.dk" d1

p1 :: Project
p1 = Project "Project Curry" 1234