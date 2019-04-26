module Msgs exposing (Msg(..))

import Navigation exposing (Location)
import Tournament.Msgs as TournamentMsgs


type Msg
    = OnLocationChange Location
    | MsgForTournament TournamentMsgs.InternalMsg
    | None
