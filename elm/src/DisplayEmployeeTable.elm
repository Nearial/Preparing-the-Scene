module DisplayEmployeeTable exposing (..)

import Html exposing (..)
import Types exposing (Employee, Employees, Message)


displayEmployeeTable : Employees -> Html Message
displayEmployeeTable employees =
    table [] [(thead []
             [ th [] [text "Firstname"]
             , th [] [text "Lastname"]
             , th [] [text "Email"]
             , th [] [text "Code"]
             , th [] [text "Name"]
             , th [] [text "Description"]
             ]
             )
             , (tbody [] (List.map displayEmployeeRow employees.employees))
             ]

displayEmployeeRow : Employee -> Html Message
displayEmployeeRow employee =
    tr []
        [ td [] [ text employee.firstName]
        , td [] [ text employee.lastName]
        , td [] [ text employee.email]
        , td [] [ text employee.department.code]
        , td [] [ text employee.department.name]
        , td [] [ text employee.department.description]
        ]