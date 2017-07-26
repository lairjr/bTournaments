module Tournament.Model exposing (..)

type alias Model =
  { id : String
  , link : String
  , name : String
  }

initialModel : Model
initialModel =
  { id = ""
  , link = ""
  , name = ""
  }
