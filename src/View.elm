module View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
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
    Models.PlayersRoute ->
      view model

    Models.NotFoundRoute ->
      notFoundView

notFoundView : Html msg
notFoundView =
  div []
      [ text "Not found" ]
