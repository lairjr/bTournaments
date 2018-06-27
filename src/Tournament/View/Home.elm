module Tournament.View.Home exposing (..)

import Date exposing (..)
import Date.Extra as Date
import Html exposing (Html, button, div, nav, p, strong, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Models as Root
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import Tournament.Components.Layout exposing (tournamentNavBar, tournamentSectionTitle)
import Tournament.Model as TournamentModel
import Tournament.Msgs as TournamentMsgs


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
                , tournamentSectionTitle "Classificação"
                , div [ class "columns is-multiline" ] (List.map group tournament.standings)
                ]

        RemoteData.Failure error ->
            text (toString error)


group : TournamentModel.Group -> Html Msg
group group =
    div [ class "column is-half" ]
        [ text group.name
        , table [ class "table" ]
            [ thead []
                [ th [] [ text "Pos" ]
                , th [] [ text "Team" ]
                , th [] [ text "Average" ]
                , th [] [ text "W" ]
                , th [] [ text "L" ]
                ]
            , tbody []
                (List.map teamRow group.teams)
            ]
        ]


teamRow : TournamentModel.Team -> Html Msg
teamRow team =
    tr []
        [ td [] [ text "1" ]
        , td [] [ text team.name ]
        , td [] [ text (toString team.average) ]
        , td [] [ text (toString team.win) ]
        , td [] [ text (toString team.loses) ]
        ]
