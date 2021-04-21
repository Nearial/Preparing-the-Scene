module ElmExamples.Functions exposing (..)

-- A Function in Elm --
function = \a b -> a + b

-- A list of functions in Elm --
var functionList = [(\a -> a * 2), (\a -> a - 2), (\a -> a + 100)]

-- High order functions
-- This Function uses our previously created function to add our chosen number, --
-- to the numbers that are in the list of numbers that the function is given. --
addToEachElement : List number -> List number
addToEachElement list = List.map (function 3) list

--Lambda
-- Our function here is chosen to use a lambda function marked by the backslash, --
-- as we have no interest in using this particular function anywhere else. --
doSomethingWithLambda : List number -> List number
doSomethingWithLambda list =
    List.map (\a -> ((1.5 * a + 3) / 2)) list

