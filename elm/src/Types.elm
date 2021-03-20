module Types exposing (..)

import Http

type alias Model =
    ( GetModel )

type alias Department =
    { code : String
    , name : String
    , description : String
    }

type alias Employee =
    { firstName : String
    , lastName : String
    , email : String
    , department : Department
    }

type alias Project =
    { title : String
    , duration : Int
    , employees : List Employee
    }

type alias Msg =
    {msg : String}

type GetModel
    = GetForm
    | GetLoading
    | GetEmployeesSuccess Employees
    | GetDepartmentsSuccess Departments
    | GetFailure Http.Error

type Message
    = GetEmployees
    | EmployeesResult (Result Http.Error Employees)
    | GetDepartment
    | DepartmentsResult (Result Http.Error Departments)

type alias Departments =
    { departments : List Department }

type alias Employees =
    { employees : List Employee }