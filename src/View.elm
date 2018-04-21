module View exposing (..)

import Common.Layout exposing (mainView)
import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, href)
import Models exposing (Model)
import Msgs exposing (Msg)
import Tournament.View.Home
import Tournament.View.Schedule


page : Model -> Html Msg
page model =
    case model.route of
        Models.TournamentHomeRoute tournamentId ->
            mainView (Tournament.View.Home.view model)

        Models.TournamentScheduleRoute tournamentId ->
            mainView (Tournament.View.Schedule.view model)

        Models.NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div [ class "container" ]
        [ div [ class "notification" ]
            [ a [ href "#tournament/copa-eduardo-lawson" ] [ text "Copa Eduardo Lawson" ] ]
        ]
