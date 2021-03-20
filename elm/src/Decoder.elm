module Decoder exposing (..)

import Types exposing (..)
import Json.Decode as Decode

employeeDecoder : Decode.Decoder Employee
employeeDecoder =
    Decode.map4 Employee
        (Decode.field "firstName" Decode.string)
        (Decode.field "lastName" Decode.string)
        (Decode.field "email" Decode.string)
        (Decode.field "department" departmentDecoder)

departmentDecoder : Decode.Decoder Department
departmentDecoder =
    Decode.map3 Department
        (Decode.field "code" Decode.string)
        (Decode.field "name" Decode.string)
        (Decode.field "description" Decode.string)

projectDecoder : Decode.Decoder Project
projectDecoder =
    Decode.map3 Project
        (Decode.field "title" Decode.string)
        (Decode.field "duration" Decode.int)
        (Decode.field "employees" (Decode.list employeeDecoder))

messageDecoder : Decode.Decoder Msg
messageDecoder =
    Decode.map Msg
        (Decode.field "message" Decode.string)

departmentsDecoder : Decode.Decoder Departments
departmentsDecoder =
    Decode.map Departments
        (Decode.field "departments" (Decode.list departmentDecoder))

employeesDecoder : Decode.Decoder Employees
employeesDecoder =
    Decode.map Employees
        (Decode.field "employees" (Decode.list employeeDecoder))