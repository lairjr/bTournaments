module View exposing (..)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, href)
import Models exposing (Model)
import Msgs exposing (Msg)

view : Model -> Html Msg
view model =
  div [ class "container" ]
      [ div [ class "notification" ]
            [ text model.message ]
      ]

page : Model -> Html Msg
page model =
  case model.route of
    Models.TournamentRoute tournamentId ->
      view model

    Models.NotFoundRoute ->
      notFoundView

notFoundView : Html msg
notFoundView =
  div [ class "container" ]
      [ div [ class "notification" ]
            [ a [ href "#tournament/copa-eduardo-lawson"] [ text "Copa Eduardo Lawson"] ]
      ]
