module Common.Layout exposing (..)

import Common.NavBar exposing (navBar)
import Html exposing (Html, a, div, footer, p, section, strong, text)
import Html.Attributes exposing (class, id)
import Msgs exposing (Msg)


mainView : Html Msg -> Html Msg
mainView page =
    div [ id "page" ]
        [ navBar
        , div [ class "container" ]
            [ page
            ]
        , footerLayout
        ]


footerLayout : Html Msg
footerLayout =
    footer [ class "footer" ]
        [ div [ class "container" ]
            [ div [ class "content has-text-centered" ]
                [ p []
                    [ strong [] [ text "My Tournaments" ]
                    ]
                ]
            ]
        ]
