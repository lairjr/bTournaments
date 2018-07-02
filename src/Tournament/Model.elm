module Tournament.Model exposing (..)

import Date exposing (..)
import RemoteData exposing (WebData)


type alias Model =
    { schedule : WebData (List ScheduleDay)
    , selectedDate : Maybe Date
    , teams : WebData (List Team)
    , tournament : WebData Tournament
    }


type alias Tournament =
    { id : String
    , link : String
    , name : String
    , standings : List Group
    }


type alias Group =
    { name : String
    , teams : List Team
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
    , position : Int
    }


type alias ScheduleDay =
    { date : Date
    , games : List Game
    }


type Msg
    = NewDate Date


initialModel : Model
initialModel =
    { schedule = RemoteData.Loading
    , selectedDate = Nothing
    , tournament = RemoteData.Loading
    , teams = RemoteData.Loading
    }
