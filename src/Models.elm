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

type alias TournamentLink = String

type Route
  = TournamentRoute TournamentLink
  | NotFoundRoute
