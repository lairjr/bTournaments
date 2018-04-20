module Tournament.Model exposing (..)

import Date exposing (..)
import RemoteData exposing (WebData)


type alias Model =
    { id : String
    , link : String
    , name : String
    , schedule : WebData (List ScheduleDay)
    , selectedDate : Maybe Date
    , teams : WebData (List Team)
    }


type alias Game =
    { id : String
    , awayTeam : String
    , awayScore : Int
    , homeTeam : String
    , homeScore : Int
    , date : Maybe Date
    }


type alias Team =
    { id : String
    , name : String
    , average : Float
    , win : Int
    , loses : Int
    }


type alias ScheduleDay =
    { date : Date
    , games : List Game
    }


type Msg
    = NewDate Date


initialModel : Model
initialModel =
    { id = ""
    , link = ""
    , name = "Copa Eduardo Lawson"
    , schedule = RemoteData.Loading
    , selectedDate = Nothing
    , teams = RemoteData.Loading
    }
