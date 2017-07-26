module Models exposing (..)

type alias Model =
    { message : String
    , route : Route
    }

initialModel : Route -> Model
initialModel route =
  { message = "Hello"
  , route = route
  }

type Route
  = PlayersRoute
  | NotFoundRoute
