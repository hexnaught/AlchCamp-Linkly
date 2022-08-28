# Linkly

Backend to explore Elixir and Ecto, based on the tutorial playlist [by Alchemist Camp](https://www.youtube.com/playlist?list=PLFhQVxlaKQElscjMvMmyMCaZ9mxf4XAw-).

Quick setup and run some example queries with seed data.

```sh
$ docker compose up -d
$ mix ecto.drop ; mix ecto.create ; mix ecto.migrate
$ mix run .example_queries.exs
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `linkly` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:linkly, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/linkly>.

# Connecting to the DB

`pgcli postgres://user:pass@localhost:5432/linkly_db`

## Useful Ecto Commands

```sh
$ mix ecto.create
$ mix ecto.drop
$ mix ecto.migrate
$ mix ecto.rollback
```

## Some Syntax Stuff

```elixir
iex> u = %Linkly.User{username: "test", email: "test@example.com", about: "This is a test user!"}
iex> {:ok, u} = Repo.insert(u)

iex> l = %Linkly.Link{url: "http://example.com"}
iex> {:ok, l} = Repo.insert(l)

iex> b = %Linkly.Bookmark{ user_id: 1, link_id: 1, title: "Default website example.com" }
iex> {:ok, b} = Repo.insert(b)

iex> u = Repo.get!(User, 1) |> Repo.preload([bookmarks: [:link]])
iex> Enum.map(u.bookmarks, & {&1.link.url})

iex> Repo.all(Link) |> Enum.map(& {Repo.preload(&1, [:bookmarks])})
```
# Changesets

Two ways to create a changeset.

```elixir
> Ecto.Changeset.change /1 /2
> Ecto.Changeset.cast /2 /3
```

For internal data, use "change", for external data, use "cast".

Commit the changes via `Repo.insert` or `Repo.update`.
