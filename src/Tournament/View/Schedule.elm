module Tournament.View.Schedule exposing (..)

import Date exposing (..)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Models as Root
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import Tournament.Model as TournamentModel


view : Root.Model -> Html Msg
view model =
    div [ class "container" ]
        [ tournamentSchedule model.tournamentModel ]


tournamentSchedule : TournamentModel.Model -> Html msg
tournamentSchedule model =
    case model.games of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success games ->
            dayRow model.selectedDate games

        RemoteData.Failure error ->
            text (toString error)


dayRow : Maybe Date -> List TournamentModel.Game -> Html msg
dayRow day games =
    div [ class "columns is-multiline" ]
        [ div [ class "column" ] [ text (toString day) ]
        , div [ class "column is-10" ]
            [ div [ class "columns is-multiline" ]
                (List.map gameRow games)
            ]
        ]


gameRow : TournamentModel.Game -> Html msg
gameRow game =
    div [ class "column is-12" ] [ text ("Jogo " ++ toString game) ]
