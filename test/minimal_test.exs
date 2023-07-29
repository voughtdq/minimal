defmodule MinimalTest do
  use ExUnit.Case
  use Plug.Test

  def req(conn) do
    Minimal.call(conn, Minimal.init([]))
  end

  test "it responds to `/`" do
    conn = conn(:get, "/") |> req()
    assert {200, _, "Hello World"} = sent_resp(conn)
  end

  test "it returns 404" do
    conn = conn(:get, "/thisshouldnotexist") |> req()
    assert {404, _, "Not Found :("} = sent_resp(conn)
  end
end
