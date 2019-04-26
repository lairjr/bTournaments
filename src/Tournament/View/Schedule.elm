module Tournament.View.Schedule exposing (dayRow, gameRow, tournamentSchedule, view, viewSchedule)

import Common.Layout exposing (mainContainer)
import Date.Extra as Date
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Models as Root
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import Tournament.Common.Layout exposing (tournamentNavBar, tournamentSectionTitle)
import Tournament.Model as TournamentModel


view : Root.Model -> Html Msg
view model =
    case model.tournamentModel.tournament of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading"

        RemoteData.Success tournament ->
            div []
                [ tournamentNavBar tournament.name
                , mainContainer (viewSchedule model.tournamentModel)
                ]

        RemoteData.Failure error ->
            text (error)


viewSchedule : TournamentModel.Model -> Html Msg
viewSchedule model =
    case model.schedule of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success schedule ->
            div []
                [ tournamentSectionTitle "Agenda"
                , tournamentSchedule schedule
                ]

        RemoteData.Failure error ->
            text (error)


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
                [ text (String.fromInt game.homeScore)
                ]
            , div [ class "column has-text-centered is-2" ] [ text "x" ]
            , div [ class "column has-text-centered is-2" ]
                [ text (String.fromInt game.awayScore)
                ]
            , div [ class "column has-text-centered is-2" ]
                [ text game.awayTeam
                ]
            ]
        ]
