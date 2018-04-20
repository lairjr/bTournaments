module Tournament.View.Schedule exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Models as Root
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import Tournament.Model as TournamentModel


view : Root.Model -> Html Msg
view model =
    div [ class "container" ]
        [ viewSchedule model.tournamentModel ]


viewSchedule : TournamentModel.Model -> Html msg
viewSchedule model =
    case model.schedule of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success schedule ->
            tournamentSchedule schedule

        RemoteData.Failure error ->
            text (toString error)


tournamentSchedule : List TournamentModel.ScheduleDay -> Html msg
tournamentSchedule scheduleDays =
    div [] (List.map dayRow scheduleDays)


dayRow : TournamentModel.ScheduleDay -> Html msg
dayRow scheduleDay =
    div [ class "columns is-multiline" ]
        [ div [ class "column" ] [ text (toString scheduleDay.date) ]
        , div [ class "column is-10" ]
            [ div [ class "columns is-multiline" ]
                (List.map gameRow scheduleDay.games)
            ]
        ]


gameRow : TournamentModel.Game -> Html msg
gameRow game =
    div [ class "column is-12" ] [ text ("Jogo " ++ toString game) ]
