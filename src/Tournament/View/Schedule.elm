module Tournament.View.Schedule exposing (..)

import Html exposing (Html, div, text)
import Models as Root
import Msgs exposing (Msg)


view : Root.Model -> Html Msg
view model =
    div [] [ text "Schedule" ]
