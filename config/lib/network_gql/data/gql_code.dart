enum GqlCode {
  Success,
  Unauthenticated,
  ValidationFailed, // Wrong query sended to gql
  DataNotFound,
  ConnectionTimeout,
  InternalServerError,
  UnprocessableEntity,
  Offline,
  Undefined
}
