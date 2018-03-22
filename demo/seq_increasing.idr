-- Theorem: The sequence defined by:
--          a_n = 2^n + 3^n
--          is an increasing sequence.

-- Define the sequence.
seq : Nat -> Nat
seq n = plus (pow 2 n) (pow 3 n)

-- Prove that the sequence is increasing.
seqInc : (n:Nat) -> LTE (seq n) (seq (S n))
seqInc Z = lteAddRight 2
seqInc n =
  rewrite (plusCommutative (pow 3 n) 0) in
  rewrite (plusCommutative (pow 2 n) 0) in
  rewrite (plusAssociative (plus (pow 2 n) (pow 2 n)) (pow 3 n) (plus (pow 3 n) (pow 3 n))) in
  rewrite (plusCommutative (plus (pow 2 n) (pow 2 n)) (pow 3 n)) in
  rewrite (plusAssociative (pow 3 n) (pow 2 n) (pow 2 n)) in
  rewrite (plusCommutative (pow 3 n) (pow 2 n)) in
  rewrite sym (plusAssociative (plus (pow 2 n) (pow 3 n)) (pow 2 n) (plus (pow 3 n) (pow 3 n))) in
          lteAddRight (plus (pow 2 n) (pow 3 n))
