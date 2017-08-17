module Tournament.Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import RemoteData
import Tournament.Model as TournamentModel
import Tournament.Msgs as TournamentMsgs

fetchTeamsCmd : Cmd TournamentMsgs.InternalMsg
fetchTeamsCmd =
  Http.get fetchTeamsCmdUrl teamsDecoder
    |> RemoteData.sendRequest
    |> Cmd.map TournamentMsgs.OnFetchTeams

fetchTeamsCmdUrl : String
fetchTeamsCmdUrl =
  "http://localhost:4000/teams"

teamsDecoder : Decode.Decoder (List TournamentModel.Team)
teamsDecoder =
  Decode.list teamDecoder

teamDecoder : Decode.Decoder TournamentModel.Team
teamDecoder =
  decode TournamentModel.Team
    |> required "id" Decode.string
    |> required "name" Decode.string
    |> required "average" Decode.float
    |> required "win" Decode.int
    |> required "loses" Decode.int
