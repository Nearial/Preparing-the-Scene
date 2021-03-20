module DisplayDepartmentTable exposing (..)

import Html exposing (..)
import Types exposing (Department, Departments, Message)

displayTable : Departments -> Html Message
displayTable departments =
    table [] [(thead []
                [ th [] [text "Code"]
                , th [] [text "Name"]
                , th [] [text "Description"]
                ])
             , (tbody [] (List.map displayRow departments.departments))
             ]


displayRow : Department -> Html Message
displayRow department =
    tr []
        [ td [] [ text department.code]
        , td [] [ text department.name]
        , td [] [ text department.description]
        ]