module Main exposing (..)

import ApiFacade exposing (..)
import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Types exposing (..)

main = Browser.element
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }

init : () -> (Model, Cmd Message)
init _ = (GetForm, Cmd.none)

update : Message -> Model -> (Model, Cmd Message)
update message model =
    case message of
        GetEmployees ->
            (GetLoading, ApiFacade.getEmployees)

        EmployeesResult result ->
            case result of
                Ok employee -> (GetEmployeesSuccess employee, Cmd.none)
                Err error -> (GetFailure error, Cmd.none)

        GetDepartment ->
            (GetLoading, ApiFacade.getDepartment)


        DepartmentsResult result ->
            case result of
                Ok departments -> (GetDepartmentsSuccess departments, Cmd.none)
                Err error -> (GetFailure error, Cmd.none)


view : Model -> Html Message
view model =
    case model of
        GetForm ->
            div []
                [ button [ onClick GetEmployees ] [ text "Get Employees" ]
                , button [ onClick GetDepartment] [ text "Get Departments" ]
                ]

        GetLoading -> text "Loading..."

        GetDepartmentsSuccess departments -> displayTable departments

        GetFailure error -> text ("An error has occurred: " ++ errorToString error)

        GetEmployeesSuccess employees -> displayEmployeeTable employees




subscriptions : Model -> Sub Message
subscriptions _ = Sub.none



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
