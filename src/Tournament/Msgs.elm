module Tournament.Msgs exposing (..)

import Date exposing (..)
import RemoteData exposing (WebData)
import Tournament.Model as TournamentModel


type InternalMsg
    = NoOp
    | FetchTournament
    | OnFetchGames (WebData (List TournamentModel.Game))
    | OnFetchSchedule (WebData (List TournamentModel.ScheduleDay))
    | OnFetchTeams (WebData (List TournamentModel.Team))
    | ReceiveDate Date
    | UpdateSelectedDate Int


type Msg
    = ForSelf InternalMsg


type alias TranslationDictionary msg =
    { onInternalMessage : InternalMsg -> msg
    }


type alias Translator msg =
    Msg -> msg


translator : TranslationDictionary msg -> Translator msg
translator { onInternalMessage } msg =
    case msg of
        ForSelf internalMsg ->
            onInternalMessage internalMsg
