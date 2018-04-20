module Tournament.Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Extra as DecodeExtra
import Json.Decode.Pipeline exposing (decode, optional, required)
import RemoteData
import Tournament.Model as TournamentModel
import Tournament.Msgs as TournamentMsgs


fetchScheduleCmd : Cmd TournamentMsgs.InternalMsg
fetchScheduleCmd =
    Http.get fetchScheduleCmdUrl scheduleDecoder
        |> RemoteData.sendRequest
        |> Cmd.map TournamentMsgs.OnFetchSchedule


fetchScheduleCmdUrl : String
fetchScheduleCmdUrl =
    "http://localhost:4000/schedules"


scheduleDecoder : Decode.Decoder (List TournamentModel.ScheduleDay)
scheduleDecoder =
    Decode.list scheduleDayDecoder


scheduleDayDecoder : Decode.Decoder TournamentModel.ScheduleDay
scheduleDayDecoder =
    decode TournamentModel.ScheduleDay
        |> required "date" DecodeExtra.date
        |> required "games" (Decode.list gameDecoder)


gameDecoder : Decode.Decoder TournamentModel.Game
gameDecoder =
    decode TournamentModel.Game
        |> required "id" Decode.string
        |> required "awayTeam" Decode.string
        |> required "awayScore" Decode.int
        |> required "homeTeam" Decode.string
        |> required "homeScore" Decode.int
        |> optional "date" (Decode.map Just DecodeExtra.date) Nothing


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
