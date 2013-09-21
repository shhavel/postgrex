defmodule LoginTest do
  use ExUnit.Case, async: true

  # NOTE: Make sure there are no "trust all" in pg_hba.conf or catch all "md5",
  # find it with `$ psql -U postgres -c "SHOW hba_file"`

  test "login cleartext password" do
    assert { :ok, pid } =
      Postgrex.connect("localhost", "postgrex_cleartext_pw", "postgrex_cleartext_pw", "postgres")
    assert :ok = Postgrex.disconnect(pid)
  end

  test "login md5 password" do
    assert { :ok, pid } =
      Postgrex.connect("localhost", "postgrex_md5_pw", "postgrex_md5_pw", "postgres")
    assert :ok = Postgrex.disconnect(pid)
  end
end