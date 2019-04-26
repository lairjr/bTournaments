module Tournament.View.Standings exposing (group, teamRow, view, viewStandings)

import Common.Layout exposing (mainContainer)
import Html exposing (Html, button, div, nav, p, strong, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class)
import Models as Root
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import String exposing (concat, toUpper)
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
                , mainContainer (viewStandings tournament)
                ]

        RemoteData.Failure error ->
            text (error)


viewStandings : TournamentModel.Tournament -> Html Msg
viewStandings tournament =
    div []
        [ tournamentSectionTitle "Classificação"
        , div [ class "columns is-multiline" ] (List.map group tournament.standings)
        ]


group : TournamentModel.Group -> Html Msg
group group =
    div [ class "column is-half" ]
        [ strong [] [ text (toUpper group.name) ]
        , table [ class "table is-fullwidth" ]
            [ thead []
                [ th [] [ text "Team" ]
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
        [ td [] [ strong [] [ text (String.fromInt team.position) ], text (concat [ " ", team.name ]) ]
        , td [] [ text (String.fromInt team.average) ]
        , td [] [ text (String.fromInt team.win) ]
        , td [] [ text (String.fromInt team.loses) ]
        ]
