module ElmExamples.UnionTypes exposing (..)

 -- A union type could look like the following --
import String exposing (fromInt)
type Status
    = Alive
    | Somewhat_Dead
    | Mostly_Dead
    | Very_Dead
-- Here we make a union type that could hold different statuses for another object --

-- Now lets make a object to make use of these statuses --
type alias Subject =
    { status : Status
    , number : Int
    }

-- Now lets make a function to return a piece of string based on what status our subject object has --
getSubjectStatus : Subject -> String
getSubjectStatus subject =
   case subject.status of
        Alive ->
            "Subject " ++ fromInt(subject.number) ++ " is currently still alive..."
        Somewhat_Dead ->
            "Subject " ++ fromInt(subject.number) ++ " is currently not looking as well as before..."
        Mostly_Dead ->
            "Subject " ++ fromInt(subject.number) ++ " is currently looking as if it is on its last legs..."
        Very_Dead ->
            "Subject " ++ fromInt(subject.number) ++ " has reached rigor mortis..."

