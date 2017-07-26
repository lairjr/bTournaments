module View exposing (..)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, href)
import Models exposing (Model)
import Msgs exposing (Msg)
import Tournament.View.Details

page : Model -> Html Msg
page model =
  case model.route of
    Models.TournamentRoute tournamentId ->
      Tournament.View.Details.view { model | tournamentModel = { id = "", link = "", name = "Copa Eduardo Lawson"} }

    Models.NotFoundRoute ->
      notFoundView

notFoundView : Html msg
notFoundView =
  div [ class "container" ]
      [ div [ class "notification" ]
            [ a [ href "#tournament/copa-eduardo-lawson"] [ text "Copa Eduardo Lawson"] ]
      ]
