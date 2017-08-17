module Tournament.Msgs exposing(..)

import RemoteData exposing (WebData)
import Tournament.Model as TournamentModel

type InternalMsg
  = NoOp
  | FetchTeams
  | OnFetchTeams (WebData (List TournamentModel.Team))

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
