defmodule GildedRoseTest do
  use ExUnit.Case

  def makeItemList(name, sell_in, quality) do
    [%Item{name: name, sell_in: sell_in, quality: quality}]
  end

  test "should degrade quality each day" do
    items = makeItemList("foo", 6, 5)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 4
  end

  test "should degrade quality twice as fast after sell by date" do
    items = makeItemList("foo", 1, 5)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 4
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 2
  end

  test "should never have a negative quality" do
    items = makeItemList("foo", 4, 0)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 0
  end

  test "should increase the quality of aged brie" do
    items = makeItemList("Aged Brie", 4, 5)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 6
  end

  test "should increase quality of aged brie twice as fast after sellin" do
    items = makeItemList("Aged Brie", 1, 10)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 11
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 13
  end

  test "should never have a quality greater than 50" do
    items = makeItemList("Aged Brie", 0, 50)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 50
  end

  test "should not degrade the quality of sulfuras" do
    items = makeItemList("Sulfuras, Hand of Ragnaros", 0, 20)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 20
  end

  test "should not change the sellin of sulfuras" do
    items = makeItemList("Sulfuras, Hand of Ragnaros", 10, 0)
    items = GildedRose.update_quality(items)
    assert List.first(items).sell_in == 10
  end

  test "should not change the quality of sulfuras, even if created with sellin passed" do
    items = makeItemList("Sulfuras, Hand of Ragnaros", -1, 10)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 10
  end

  test "should increase quality of backstage pass twice as fast when less than 10 days remain" do
    items = makeItemList("Backstage passes to a TAFKAL80ETC concert", 11, 20)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 21
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 23
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 25
  end

  test "should increase quality of backstage pass three times as fast when 5 days left" do
    items = makeItemList("Backstage passes to a TAFKAL80ETC concert", 6, 20)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 22
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 25
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 28
  end

  test "should never increase quality of backstage pass past maximum, even if close to concert" do
    items = makeItemList("Backstage passes to a TAFKAL80ETC concert", 5, 50)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 50
  end

  test "should set quality to zero for backstagepass after expires" do
    items = makeItemList("Backstage passes to a TAFKAL80ETC concert", 1, 10)
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 13
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 0
    items = GildedRose.update_quality(items)
    assert List.first(items).quality == 0
  end

end