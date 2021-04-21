module ElmExamples.Currying exposing (..)

-- A simple example of currying could be something like the following function. --
multThree : number -> number -> number -> number
multThree x y z = x * y * z

-- A function can also use another function in its call, like the following: --
applyTwice : (a -> a) -> a -> a
applyTwice f x = f (f x)

putTogether : number
putTogether = applyTwice (multThree 2 3) 4
-- This should then return 144, the math behind sounds as following ((2 * 3 * 2 * 3 = 36) * 4 = 96) --

-- Our good old multThree function can also easily be used in conjunction with the map function --
-- to multiply the elements within it by our chosen numbers --
mapExample : List number -> List number
mapExample list = List.map (multThree 2 2) list
-- This should then result in every element within the list being passed through --
-- the multThree function as (2 * 2 * listElement) --