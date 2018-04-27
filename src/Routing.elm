module Routing exposing (..)

import Models exposing (Route(..))
import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map TournamentHomeRoute (s "tournament" </> string)
        , map TournamentHomeRoute (s "tournament" </> string </> s "home")
        , map TournamentScheduleRoute (s "tournament" </> string </> s "schedule")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
