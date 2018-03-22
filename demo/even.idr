mutual
  -- Definition of odd. If n is odd, returns `Just k` such that n=2*k+1.
  -- Otherwise returns `Nothing`.
  total
  odd : Nat -> Maybe Nat
  odd Z = Nothing
  odd (S n) = even n

  -- Definition of even. If n is even, returns `Just k` such that n=2*k.
  -- Otherwise returns `Nothing`.
  total
  even : Nat -> Maybe Nat
  even Z = Just 0
  even (S n) = map S $ odd n

-- Proof that if the successors to some `Maybe Nat`s are equal, then the `Maybe Nat`s are equal.
total
mapSuccSym : (a:Maybe Nat) -> (b:Maybe Nat) -> (map S a = map S b) -> a = b
mapSuccSym Nothing Nothing = \x => x
mapSuccSym Nothing (Just _) = absurd . nothingNotJust
mapSuccSym (Just _) Nothing = absurd . nothingNotJust . sym
mapSuccSym (Just a) (Just b) = cong {f=Just} . plusLeftCancel 1 a b . justInjective {x=S a} {y=S b}

-- Proof that one less than an even number is odd.
total
evenLessOneOdd : (even $ S n = Just $ S k) -> odd n = Just k
evenLessOneOdd {n=n} {k=k} = mapSuccSym (odd n) (Just $ k)

-- Proof that two less than an even number is even.
total
evenLessTwoEven : (even $ S $ S n = Just $ S k) -> even n = Just k
evenLessTwoEven eut = evenLessOneOdd eut

total
mapSIsNotZ : {n: Maybe Nat} -> (map S n = Just Z) -> Void
mapSIsNotZ {n=Nothing} = nothingNotJust
mapSIsNotZ {n=Just n} = SIsNotZ . justInjective

-- Any even number `n` can be written as some k + k.
total
evenIsPlusSelf : (even n = Just k) -> n = k + k
evenIsPlusSelf {n=Z} pk = rewrite sym $ justInjective pk in Refl
evenIsPlusSelf {n=S Z} pk = absurd $ nothingNotJust pk
evenIsPlusSelf {n=S n} {k=Z} pk = absurd $ mapSIsNotZ pk
evenIsPlusSelf {n=S $ S n} {k=S k} pk =
  rewrite sym $ plusSuccRightSucc k k in
    plusConstantLeft n (plus k k) 2 (evenIsPlusSelf {n=n} {k=k} (evenLessTwoEven pk))

-- Any even number `n` can be written as some 2 * k.
total
evenIsTimesTwo : (even n = Just k) -> n = 2 * k
evenIsTimesTwo {k=k} pk =
  rewrite plusZeroRightNeutral k in
    evenIsPlusSelf pk

-- For any even number `n`, n + n is even.
total
plusSelfEven : (n:Nat) -> even $ n + n = Just n
plusSelfEven Z = Refl
plusSelfEven (S n) = 
  rewrite plusCommutative n (1 + n) in
  rewrite plusSelfEven n in Refl

-- For any even number `n`, 2 * n is even.
total
timesTwoEven : (n:Nat) -> even $ 2 * n = Just n
timesTwoEven n =
  rewrite plusZeroRightNeutral n in
    plusSelfEven n

-- Any even number `n` plus any other even number `m` is even.
total
plusEvenEven : (even n = Just k) -> (even m = Just j) -> even $ m + n = Just $ j + k
plusEvenEven {n=n} {k=k} {m=m} {j=j} pk pj =
  rewrite evenIsPlusSelf {n=n} {k=k} pk in
  rewrite evenIsPlusSelf {n=m} {k=j} pj in
  rewrite sym $ plusAssociative j j (k+k) in
  rewrite plusAssociative j k k in
  rewrite plusCommutative (plus j k) k in
  rewrite plusAssociative j k (j+k) in
    plusSelfEven (plus j k)

-- Any natural number `y` times an even number `x` is even.
total
timesEven : (even x = Just k) -> (y:Nat) -> even $ x * y = Just $ k * y
timesEven {x=x} {k=k} pk y =
  rewrite evenIsTimesTwo {n=x} pk in
  rewrite sym $ multAssociative 2 k y in
    timesTwoEven (k * y)

-- Any even number `x` to some positive integer power `p+1` is even.
total
powerEven : (even x = Just k) -> (p:Nat) -> even $ power x $ S p = Just $ k * power x p
powerEven {x=x} {k=k} ex p = timesEven {x=x} ex $ power x p
