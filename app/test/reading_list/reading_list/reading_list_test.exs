defmodule ReadingList.ReadingListTest do
  use ReadingList.DataCase

  alias ReadingList.ReadingList

  describe "media" do
    alias ReadingList.ReadingList.Media

    @valid_attrs %{author: "some author", description: "some description", link: "some link", title: "some title"}
    @update_attrs %{author: "some updated author", description: "some updated description", link: "some updated link", title: "some updated title"}
    @invalid_attrs %{author: nil, description: nil, link: nil, title: nil}

    def media_fixture(attrs \\ %{}) do
      {:ok, media} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ReadingList.create_media()

      media
    end

    test "list_media/0 returns all media" do
      media = media_fixture()
      assert ReadingList.list_media() == [media]
    end

    test "get_media!/1 returns the media with given id" do
      media = media_fixture()
      assert ReadingList.get_media!(media.id) == media
    end

    test "create_media/1 with valid data creates a media" do
      assert {:ok, %Media{} = media} = ReadingList.create_media(@valid_attrs)
      assert media.author == "some author"
      assert media.description == "some description"
      assert media.link == "some link"
      assert media.title == "some title"
    end

    test "create_media/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ReadingList.create_media(@invalid_attrs)
    end

    test "update_media/2 with valid data updates the media" do
      media = media_fixture()
      assert {:ok, media} = ReadingList.update_media(media, @update_attrs)
      assert %Media{} = media
      assert media.author == "some updated author"
      assert media.description == "some updated description"
      assert media.link == "some updated link"
      assert media.title == "some updated title"
    end

    test "update_media/2 with invalid data returns error changeset" do
      media = media_fixture()
      assert {:error, %Ecto.Changeset{}} = ReadingList.update_media(media, @invalid_attrs)
      assert media == ReadingList.get_media!(media.id)
    end

    test "delete_media/1 deletes the media" do
      media = media_fixture()
      assert {:ok, %Media{}} = ReadingList.delete_media(media)
      assert_raise Ecto.NoResultsError, fn -> ReadingList.get_media!(media.id) end
    end

    test "change_media/1 returns a media changeset" do
      media = media_fixture()
      assert %Ecto.Changeset{} = ReadingList.change_media(media)
    end
  end
end
