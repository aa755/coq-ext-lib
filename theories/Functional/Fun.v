Require Import List.
Require Import Monad.
Require Import Monad.Folds.

Set Implicit Arguments.
Set Strict Implicit.

Definition compose A B C (g:B -> C) (f:A -> B) (x:A) : C := g (f x).

Definition forEach A B (xs:list A) (f:A -> B) : list B := map f xs.

Definition forEachM {m} {M:Monad m} {A B} (xs:list A) (f:A -> m B) : m (list B) :=
  mapM f xs.

Module FunNotation.

  Notation "f $ x" := (f x)
    (at level 99, x at level 99, right associativity, only parsing).

  Notation "'begin' e1 'end'" := (e1)
    (at level 0, only parsing).

End FunNotation.
