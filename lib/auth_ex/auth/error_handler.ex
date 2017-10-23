## lib/auth_ex/auth/error_handler.ex
defmodule AuthEx.Auth.ErrorHandler do
  import Plug.Conn

  def auth_error(conn, {type, reason}, _opts) do
    body = to_string(type)
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(401, body)
  end
end