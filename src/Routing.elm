module Routing exposing (matchers, parseLocation)

import Models exposing (Route(..))
import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map TournamentStandingsRoute (s "tournament" </> string)
        , map TournamentStandingsRoute (s "tournament" </> string </> s "standings")
        , map TournamentScheduleRoute (s "tournament" </> string </> s "schedule")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
