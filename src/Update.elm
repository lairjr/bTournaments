module Update exposing (..)

import Models exposing (Model)
import Msgs exposing (Msg(..))
import Tournament.Update as TournamentUpdate
import Tournament.Msgs as TournamentMsgs

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  ( updateModel msg model, updateCmd msg )

updateModel : Msg -> Model -> Model
updateModel msg model =
  case msg of
    MsgForTournament msg_ ->
      { model | tournamentModel = TournamentUpdate.updateModel msg_ model.tournamentModel }

    _ ->
      model

updateCmd : Msg -> Cmd Msg
updateCmd msg =
  case msg of
    MsgForTournament msg_ ->
      TournamentUpdate.updateCmd msg_
        |> Cmd.map tournamentTranslator

    _ ->
      Cmd.none

tournamentTranslator : TournamentMsgs.InternalMsg -> Msg
tournamentTranslator =
  MsgForTournament
