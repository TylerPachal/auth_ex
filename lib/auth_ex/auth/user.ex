defmodule AuthEx.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AuthEx.Auth.User
  alias Comeonin.Bcrypt

  schema "users" do
    field :password, :string
    field :username, :string

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> put_pass_hash()  # Also hash the password so we aren't storing plain-text passwords
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
  defp put_pass_hash(changeset), do: changeset
end
