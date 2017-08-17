module Tournament.Model exposing (..)

import RemoteData exposing (WebData)

type alias Model =
  { id : String
  , link : String
  , name : String
  , teams : WebData (List Team)
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
  , link = ""
  , name = "Copa Eduardo Lawson"
  , teams = RemoteData.Loading
  }
