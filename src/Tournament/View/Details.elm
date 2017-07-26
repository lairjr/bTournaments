module Tournament.View.Details exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Models as Root

view : Root.Model -> Html Msg
view model =
  div [ class "container" ]
    [ div [ class "notification" ]
          [ text model.tournamentModel.name ]
    ]
