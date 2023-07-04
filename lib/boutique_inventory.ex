defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(&(&1.price), :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(!&1.price))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn each ->
      %{each | name: String.replace(each.name, old_word, new_word)}
    end)
  end

  def increase_quantity(item, n) do
    %{ item | quantity_by_size: Map.new(item.quantity_by_size, fn {k, v} -> {k, v + n} end)}
  end


  def total_quantity(item) do
    item.quantity_by_size
    |>Enum.reduce(0, fn {_size, num}, acc -> acc + num end)
  end
end
