module ApiFacade exposing (..)

import Decoder as Decoder
import Http exposing (Error(..))
import Types exposing (Message(..))

getEmployees : Cmd Message
getEmployees = Http.get
    { url = "http://localhost:8080/jpareststarter/api/employee/"
    , expect = Http.expectJson EmployeesResult Decoder.employeesDecoder
    }

getDepartment : Cmd Message
getDepartment = Http.get
    { url = "http://localhost:8080/jpareststarter/api/department/"
    , expect = Http.expectJson DepartmentsResult Decoder.departmentsDecoder
    }

errorToString : Http.Error -> String
errorToString error =
    case error of
        BadUrl url ->
            ("Error, bad url: "++ url)
        Timeout ->
            "Error, connection timed out"
        NetworkError ->
            "Network Error"
        BadStatus code ->
            ("Error "++ String.fromInt code)
        BadBody errMsg ->
            ("Something went wrong with the body: " ++ errMsg)