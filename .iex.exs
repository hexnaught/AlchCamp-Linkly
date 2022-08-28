import_if_available(Ecto.Query)
import_if_available(Ecto.Changeset)

alias Ecto.Adapters.SQL
alias Linkly.Repo
alias Linkly.{Bookmark, Link, LinkTags, Tags, User}

u = %Linkly.User{
  username: "test",
  email: "test@example.com",
  about: "This is a test user!"
}

defmodule MyCLI do
  IEx.configure(
    colors: [
      syntax_colors: [
        number: :light_yellow,
        atom: :light_cyan,
        string: :light_black,
        boolean: [:light_blue],
        nil: [:magenta, :bright]
      ],
      ls_directory: :cyan,
      ls_device: :yellow,
      doc_code: :green,
      doc_inline_code: :magenta,
      doc_headings: [:cyan, :underline],
      doc_title: [:cyan, :bright, :underline]
    ],
    default_prompt:
      [
        # ANSI CHA, move cursor to column 1
        "\e[G",
        :light_magenta,
        # plain string
        "🧪 iex",
        ">",
        :white,
        :reset
      ]
      |> IO.ANSI.format()
      |> IO.chardata_to_string()
  )
end
