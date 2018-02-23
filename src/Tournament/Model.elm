module Tournament.Model exposing (..)

import RemoteData exposing (WebData)
import Date exposing (..)

type alias Model =
  { id : String
  , games : WebData (List Game)
  , link : String
  , name : String
  , teams : WebData (List Team)
  }

type alias Game =
  { id : String
  , awayTeam : String
  , awayScore : Int
  , homeTeam : String
  , homeScore : Int
  , date : Date
  }

type alias Team =
  { id : String
  , name : String
  , average: Float
  , win : Int
  , loses : Int
  }

initialModel : Model
initialModel =
  { id = ""
  , games = RemoteData.Loading
  , link = ""
  , name = "Copa Eduardo Lawson"
  , teams = RemoteData.Loading
  }
