module Tournament.View.Schedule exposing (..)

import Date.Extra as Date
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Models as Root
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import Tournament.Components.Layout exposing (tournamentNavBar, tournamentSectionTitle)
import Tournament.Model as TournamentModel


view : Root.Model -> Html Msg
view model =
    div []
        [ tournamentNavBar model.tournamentModel.name
        , tournamentSectionTitle "Agenda"
        , viewSchedule model.tournamentModel
        ]


viewSchedule : TournamentModel.Model -> Html msg
viewSchedule model =
    case model.schedule of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success schedule ->
            tournamentSchedule schedule

        RemoteData.Failure error ->
            text (toString error)


tournamentSchedule : List TournamentModel.ScheduleDay -> Html msg
tournamentSchedule scheduleDays =
    div [ class "columns is-multiline" ] (List.map dayRow scheduleDays)


dayRow : TournamentModel.ScheduleDay -> Html msg
dayRow scheduleDay =
    div [ class "column is-12" ]
        [ div [ class "columns is-multiline" ]
            [ div [ class "column" ] [ text (Date.toFormattedString "EEEE, MMMM d, y" scheduleDay.date) ]
            , div [ class "column is-10" ]
                [ div [ class "columns is-multiline" ]
                    (List.map gameRow scheduleDay.games)
                ]
            ]
        ]


gameRow : TournamentModel.Game -> Html msg
gameRow game =
    div [ class "column is-12" ]
        [ div [ class "columns" ]
            [ div [ class "column has-text-centered is-2" ]
                [ text game.homeTeam
                ]
            , div [ class "column has-text-centered is-2" ]
                [ text (toString game.homeScore)
                ]
            , div [ class "column has-text-centered is-2" ] [ text "x" ]
            , div [ class "column has-text-centered is-2" ]
                [ text (toString game.awayScore)
                ]
            , div [ class "column has-text-centered is-2" ]
                [ text game.awayTeam
                ]
            ]
        ]
