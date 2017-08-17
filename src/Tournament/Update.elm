module Tournament.Update exposing(..)

import Tournament.Model as TournamentModel
import Tournament.Msgs as TournamentMsgs
import Tournament.Commands exposing(fetchTeamsCmd)

updateModel : TournamentMsgs.InternalMsg -> TournamentModel.Model -> TournamentModel.Model
updateModel msg model =
  case msg of
    TournamentMsgs.FetchTeams ->
      model
    TournamentMsgs.OnFetchTeams teams ->
      { model | teams = teams }
    _ ->
      model

updateCmd : TournamentMsgs.InternalMsg -> Cmd TournamentMsgs.InternalMsg
updateCmd msg =
  case msg of
    TournamentMsgs.FetchTeams ->
      fetchTeamsCmd

    _ ->
      Cmd.none
