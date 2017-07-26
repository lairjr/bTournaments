module Tournament.View.Details exposing (..)

import Html exposing (Html, div, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models as Root
import Tournament.Model as TournamentModel

view : Root.Model -> Html Msg
view model =
  div [ class "container" ]
      [ div [ class "notification" ]
            [ text model.tournamentModel.name ]
      , tournamentTable model.tournamentModel
      ]

tournamentTable : TournamentModel.Model -> Html Msg
tournamentTable model =
  table [ class "table" ]
        [ thead []
                [ th [] [ text "Pos" ]
                , th [] [ text "Team" ]
                , th [] [ text "Average" ]
                , th [] [ text "W" ]
                , th [] [ text "L" ]
                ]
        , tbody []
                (List.map teamRow model.teams)
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
