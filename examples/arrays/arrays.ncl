# test = 'pass'

# Example array functions. This code is illustrative: prefer using the array
# stdlib functions `std.array.map` and `std.array.fold_right` instead.
let rec
  map
    : forall a b. (a -> b) -> Array a -> Array b
    = fun f =>
      match {
        [] => [],
        [head, ..tail] => [f head] @ map f tail,
      },
  fold
    : forall a b. (a -> b -> b) -> b -> Array a -> b
    = fun f first =>
      match {
        [] => first,
        [head, ..tail] => f head (fold f first tail),
      },
in
# Compute `7!`
[1, 2, 3, 4, 5, 6]
|> map ((+) 1)
|> fold (*) 1
