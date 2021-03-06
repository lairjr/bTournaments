module Tournament.Update exposing (..)

import Date exposing (..)
import Date.Extra as Date
import Task
import Tournament.Commands exposing (fetchScheduleCmd, fetchTeamsCmd, fetchTournamentCmd)
import Tournament.Model as TournamentModel
import Tournament.Msgs as TournamentMsgs


updateModel : TournamentMsgs.InternalMsg -> TournamentModel.Model -> TournamentModel.Model
updateModel msg model =
    case msg of
        TournamentMsgs.FetchTournament ->
            model

        TournamentMsgs.OnFetchSchedule schedule ->
            { model | schedule = schedule }

        TournamentMsgs.OnFetchTeams teams ->
            { model | teams = teams }

        TournamentMsgs.OnFetchTournament tournament ->
            { model | tournament = tournament }

        TournamentMsgs.ReceiveDate date ->
            { model | selectedDate = Just date }

        _ ->
            model


updateCmd : TournamentMsgs.InternalMsg -> Cmd TournamentMsgs.InternalMsg
updateCmd msg =
    case msg of
        TournamentMsgs.FetchTournament ->
            Cmd.batch [ fetchTournamentCmd, fetchScheduleCmd, fetchTeamsCmd, Task.perform TournamentMsgs.ReceiveDate Date.now ]

        _ ->
            Cmd.none
