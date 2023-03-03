defmodule BlackJack do

  @cartas ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  @valores %{"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11}
  @simbolos ["♠", "♥", "♦", "♣"]

  def empezar do
    #robar_carta?()
    IO.puts("¿como te llamas?")
    nombre_jugador = IO.gets("")
    jugador1 = %{"nombre" => nombre_jugador, "puntaje" => 0}
    jugador2 = %{"nombre" => "PC", "puntaje" => 0}
    nueva_ronda(jugador1, jugador2)
    #IO.puts(jugador1)
    #comparar_puntajes(Map.get(jugador1, "puntaje"), Map.get(jugador2, "puntaje"))
  end

  def nueva_ronda(jugador1, jugador2) do
    carta_jugador = obtener_carta()
    carta_pc = obtener_carta()
    #IO.puts("carta " <> Map.get(jugador1, "nombre") <> " = " <> carta_jugador <> Enum.random(@simbolos))
    #IO.puts("carta " <> Map.get(jugador2, "nombre") <> " = " <> carta_pc <> Enum.random(@simbolos))
    IO.puts("carta " <> Map.get(jugador1, "nombre") <> " = " <> carta_jugador)
    IO.puts("carta " <> Map.get(jugador2, "nombre") <> " = " <> carta_pc)
  end

  def obtener_carta do
    Enum.random(@cartas)
  end

  def robar_carta? do
    IO.puts("¿Robar carta? (y/n)")
    input = String.downcase(IO.gets(""))
    case input do
      "y\n" -> true
      "n\n" -> false
    end
  end

  #Comparar puntajes
  def comparar_puntajes(puntaje_jugador, puntaje_pc) when puntaje_jugador > puntaje_pc do
    IO.puts("El jugador ganó.")
  end

  def comparar_puntajes(puntaje_jugador, puntaje_pc) when puntaje_jugador < puntaje_pc do
    IO.puts("El PC ganó.")
  end

  def comparar_puntajes(puntaje_jugador, puntaje_pc) when puntaje_jugador == puntaje_pc do
    IO.puts("Empate.")
  end

end
