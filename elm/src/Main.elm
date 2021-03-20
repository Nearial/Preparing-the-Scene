module Main exposing (..)

import ApiFacade exposing (..)
import Browser
import DisplayDepartmentTable exposing (displayTable)
import DisplayEmployeeTable exposing (displayEmployeeTable)
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
        GetForm -> displayButtons

        GetLoading -> text "Loading..."

        GetDepartmentsSuccess departments ->
            div [] [displayButtons, displayTable departments]

        GetEmployeesSuccess employees ->
            div [] [displayButtons, displayEmployeeTable employees]

        GetFailure error ->
            div [] [displayButtons, text ("An error has occurred: " ++ errorToString error)]





subscriptions : Model -> Sub Message
subscriptions _ = Sub.none

displayButtons : Html Message
displayButtons =
    div []
        [ button [ onClick GetEmployees ] [ text "Get Employees" ]
        , button [ onClick GetDepartment] [ text "Get Departments" ]
        ]




