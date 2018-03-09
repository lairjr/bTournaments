module Tournament.View.Details exposing (..)

import Date exposing (..)
import Date.Extra as Date
import Debug
import Html exposing (Html, div, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models as Root
import RemoteData exposing (WebData)
import Tournament.Model as TournamentModel

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

compareDay : Maybe Date -> TournamentModel.Game -> Bool
compareDay date game =
  case date of
      Just firstDate ->
        case game.date of
          Just gameDate ->
            Date.equalBy Date.Day firstDate gameDate

          Nothing ->
            False

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
      let
        selectedGames = List.filter (compareDay model.selectedDate) games
      in
        div [] [ div [ class "columns" ]
                     [ div [ class "column is-1" ] [ text "<" ]
                     , div [ class "column" ] [ text (toString model.selectedDate)]
                     , div [ class "column is-1" ] [ text ">" ]
                     ]
               , div [ class "tile is-ancestor is-vertical" ]
                     (List.map gameRow selectedGames)
               ]

gameRow : TournamentModel.Game -> Html Msg
gameRow game =
  div [ class "tile is-child box" ] [
    div [ class "columns" ]
        [ div [ class "column " ] [ text game.homeTeam ]
        , div [ class "column " ] [ text "x" ]
        , div [ class "column " ] [ text game.awayTeam ]
        ]
    ]
