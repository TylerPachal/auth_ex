defmodule AuthEx.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :auth_ex,
    error_handler: AuthEx.Auth.ErrorHandler,
    module: AuthEx.Auth.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end