module Tournament.Model exposing (..)

import Date exposing (..)
import RemoteData exposing (WebData)


type alias Model =
    { id : String
    , games : WebData (List Game)
    , link : String
    , name : String
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


type Msg
    = NewDate Date


initialModel : Model
initialModel =
    { id = ""
    , games = RemoteData.Loading
    , link = ""
    , name = "Copa Eduardo Lawson"
    , selectedDate = Nothing
    , teams = RemoteData.Loading
    }
