module Models exposing (Model, Route(..), TournamentLink, initialModel)

import Tournament.Model as Tournament


type alias Model =
    { route : Route
    , tournamentModel : Tournament.Model
    }


initialModel : Route -> Model
initialModel route =
    { route = route
    , tournamentModel = Tournament.initialModel
    }


type alias TournamentLink =
    String


type Route
    = TournamentStandingsRoute TournamentLink
    | TournamentScheduleRoute TournamentLink
    | NotFoundRoute
