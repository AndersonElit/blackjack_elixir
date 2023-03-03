defmodule BlackJack do

  @cartas ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  @valores %{"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11}
  #@simbolos ["♠", "♥", "♦", "♣"]

  def empezar do
    IO.puts("¿como te llamas?")
    jugador1 = IO.gets("")
    jugador2 = "PC"
    puntaje_jugador_1 = []
    puntaje_jugador_2 = []
    {puntaje_jugador_1, puntaje_jugador_2} = ronda(jugador1, puntaje_jugador_1, jugador2, puntaje_jugador_2)

    IO.puts(Enum.sum(puntaje_jugador_1))
    IO.puts(Enum.sum(puntaje_jugador_2))

  end

  def ronda(jugador1, puntaje1, jugador2, puntaje2) do
    carta1 = obtener_carta()
    carta2 = obtener_carta()
    IO.puts("carta " <> jugador1 <> " = " <> carta1)
    IO.puts("carta " <> jugador2 <> " = " <> carta2)
    nuevo_puntaje_1 = puntaje1 ++ [Map.get(@valores, carta1)]
    nuevo_puntaje_2 = puntaje2 ++ [Map.get(@valores, carta2)]
    if robar_carta?() and Enum.sum(nuevo_puntaje_1) < 21 and Enum.sum(nuevo_puntaje_2) < 21 do
      ronda(jugador1, nuevo_puntaje_1, jugador2, nuevo_puntaje_2)
    else
      comparar_puntajes(Enum.sum(nuevo_puntaje_1), Enum.sum(nuevo_puntaje_2))
      {nuevo_puntaje_1, nuevo_puntaje_2}
    end
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
    cond do
      puntaje_jugador > 21 -> IO.puts("El PC ganó.")
      true -> IO.puts("El jugador ganó.")
    end
  end

  def comparar_puntajes(puntaje_jugador, puntaje_pc) when puntaje_jugador < puntaje_pc do
    cond do
      puntaje_pc > 21 -> IO.puts("El jugador ganó.")
      true -> IO.puts("El PC ganó.")
    end
  end

  def comparar_puntajes(puntaje_jugador, puntaje_pc) when puntaje_jugador == puntaje_pc do
    cond do
      puntaje_jugador > 21 -> IO.puts("ambos superan los 21 puntos.")
      true -> IO.puts("Empate.")
    end
  end

end
