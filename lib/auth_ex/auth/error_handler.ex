## lib/auth_ex/auth/error_handler.ex
defmodule AuthEx.Auth.ErrorHandler do
  import Plug.Conn

  def auth_error(conn, {type, _reason}, _opts) do
    body = to_string(type)
    send_resp(conn, 401, body)
  end
end