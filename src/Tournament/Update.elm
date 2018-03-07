module Tournament.Update exposing(..)

import Date exposing (..)
import Tournament.Model as TournamentModel
import Tournament.Msgs as TournamentMsgs
import Tournament.Commands exposing(fetchGamesCmd, fetchTeamsCmd)
import Task

updateModel : TournamentMsgs.InternalMsg -> TournamentModel.Model -> TournamentModel.Model
updateModel msg model =
  case msg of
    TournamentMsgs.FetchTournament ->
      model
    TournamentMsgs.OnFetchGames games ->
      { model | games = games }
    TournamentMsgs.OnFetchTeams teams ->
      { model | teams = teams }
    TournamentMsgs.ReceiveDate date ->
      { model | selectedDate = Just date }
    _ ->
      model

updateCmd : TournamentMsgs.InternalMsg -> Cmd TournamentMsgs.InternalMsg
updateCmd msg =
  case msg of
    TournamentMsgs.FetchTournament ->
      Cmd.batch([fetchGamesCmd, fetchTeamsCmd, Task.perform TournamentMsgs.ReceiveDate Date.now ])

    _ ->
      Cmd.none
