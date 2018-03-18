module Tournament.View.Home exposing (..)

import Date exposing (..)
import Date.Extra as Date
import Html exposing (Html, button, div, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Models as Root
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import Tournament.Model as TournamentModel
import Tournament.Msgs as TournamentMsgs


view : Root.Model -> Html Msg
view model =
    div [ class "container" ]
        [ div [ class "notification" ]
            [ text model.tournamentModel.name ]
        , div [ class "columns is-multiline" ]
            [ div [ class "column is-two-thirds" ]
                [ tournamentTable model.tournamentModel ]
            , div [ class "column" ]
                [ tournamentCalendar model.tournamentModel ]
            ]
        ]


tournamentTable : TournamentModel.Model -> Html Msg
tournamentTable model =
    case model.teams of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success teams ->
            table [ class "table" ]
                [ thead []
                    [ th [] [ text "Pos" ]
                    , th [] [ text "Team" ]
                    , th [] [ text "Average" ]
                    , th [] [ text "W" ]
                    , th [] [ text "L" ]
                    ]
                , tbody []
                    (List.map teamRow teams)
                ]

        RemoteData.Failure error ->
            text (toString error)


teamRow : TournamentModel.Team -> Html Msg
teamRow team =
    tr []
        [ td [] [ text "1" ]
        , td [] [ text team.name ]
        , td [] [ text (toString team.average) ]
        , td [] [ text (toString team.win) ]
        , td [] [ text (toString team.loses) ]
        ]


compareDay : Date -> TournamentModel.Game -> Bool
compareDay date game =
    case game.date of
        Just gameDate ->
            Date.equalBy Date.Day date gameDate

        Nothing ->
            False


tournamentCalendar : TournamentModel.Model -> Html Msg
tournamentCalendar model =
    case model.games of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading"

        RemoteData.Failure error ->
            text (toString error)

        RemoteData.Success games ->
            case model.selectedDate of
                Just selectedDate ->
                    let
                        selectedGames =
                            List.filter (compareDay selectedDate) games
                    in
                    div []
                        [ div [ class "columns" ]
                            [ div [ class "column is-1" ] [ button [ onClick (Msgs.MsgForTournament (TournamentMsgs.UpdateSelectedDate -1)) ] [ text "<" ] ]
                            , div [ class "column" ] [ text (String.concat [ toString (Date.day selectedDate), "/", toString (Date.month selectedDate) ]) ]
                            , div [ class "column is-1" ] [ button [ onClick (Msgs.MsgForTournament (TournamentMsgs.UpdateSelectedDate 1)) ] [ text ">" ] ]
                            ]
                        , div [ class "tile is-ancestor is-vertical" ]
                            (List.map gameRow selectedGames)
                        ]

                Nothing ->
                    text "Error"


gameRow : TournamentModel.Game -> Html Msg
gameRow game =
    div [ class "tile is-child box" ]
        [ div [ class "columns" ]
            [ div [ class "column " ] [ text game.homeTeam ]
            , div [ class "column " ] [ text "x" ]
            , div [ class "column " ] [ text game.awayTeam ]
            ]
        ]
