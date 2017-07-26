module Tournament.Model exposing (..)

type alias Model =
  { id : String
  , link : String
  , name : String
  , teams : List Team
  }

type alias Team =
  { name : String
  , average: Float
  , win : Int
  , loses : Int
  }

initialModel : Model
initialModel =
  { id = ""
  , link = ""
  , name = "Copa Eduardo Lawson"
  , teams = [ { name = "Titios", average = 9.2, win = 10, loses = 2 } ]
  }
