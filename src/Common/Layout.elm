module Common.Layout exposing (..)

import Common.NavBar exposing (navBar)
import Html exposing (Html, div, text)
import Msgs exposing (Msg)


mainView : Html Msg -> Html Msg
mainView page =
    div []
        [ navBar
        , page
        , text "Footer"
        ]
