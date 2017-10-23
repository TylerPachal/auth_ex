defmodule AuthExWeb.PageControllerTest do
  use AuthExWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Login Page"
  end
end
