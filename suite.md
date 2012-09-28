#Rappels

- Expression-oriented
- Declarative
- Ordre supérieur

#TypeClass

- Interfaces on steroids
- Better traits
- Open World assupmtion
- Implémentation découplée du type

# Syntaxe en Haskell
Intégré au langage
Utilisé partout (égalité, comparaison, types numériques...)

    -- Définition de la classe
    class MyClass a where
        foo :: a -> a
        bar :: a -> Bool
        baz = bar . foo

    -- Implémentation de la classe par un type
    instance MyClass Int where
        foo = (+2)
        bar = (==0)

    -- Utilisation
    foobar :: (MyClass a) => a -> Bool
    foobar = baz

# En Scala
Pas vraiment intégré au langage
Réalisé à l'aide d'implicits

    // Déclaration
    trait MyClass[A] {
        def foo(a: A): A
        def bar(a: A): Boolean
        def baz(a: A): Boolean = bar(foo(a))
    }

    // Implémentation
    implicit object IntMyClass extends MyClass[Int] {
        def foo(l: Int) = l + 2
        def bar(l: Int) = (l == 0)
    }

    // Utilisation
    def foobar[A: MyClass](l: A) = {
        implicitly[MyClass[A]].baz(l)
    }

    // Ou
    def foobar[A](l: A)(implicit ev: MyClass[A]) = {
        ev.baz(l)
    }

# En Ocaml

    module type MyModule = sig
     val foo : 'a -> 'a
     val bar : 'a -> bool
     val baz : 'a -> bool
    end;;


    module MyModuleInt(A : MyModule) = struct include A
     let foo i= (i+2)
     let bar i = (i=0)
     let baz  i = bar(foo i)
    end;;
 



#Exemples de typeclass

    class Eq a where
        (==) :: a -> a -> Bool
        (/=) :: a -> a -> Bool
        x == y = not (x /= y)
        x /= y = not (x == y)

    class Eq a => Ord a where
        compare :: a -> a -> Ordering
        (<) :: a -> a -> Bool
        (>=) :: a -> a -> Bool
        (>) :: a -> a -> Bool
        (<=) :: a -> a -> Bool
        max :: a -> a -> a
        min :: a -> a -> a

#Foncteur

Construction mathématique de la théorie des catégories

Implémentation en Haskell

    class Functor f where
        fmap :: (a -> b) -> f a -> f b

Permet de représenter une valeur dans un contexte, et d'injecter des
traitements au sein du contexte

    fmap (+3) Just 2
    fmap (+3) [2,3,5]


#Foncteur applicatif

    class (Functor f) => Applicative  f where
        pure :: a -> f a
        <*> :: f (a -> b) -> f a -> f b

    Permet l'application d'une fonction à plusieurs arguments dans un contexte


#Monades

    class Monad m where
        return :: a -> m a
        (>>=) :: m a -> (a -> m b) -> m b

        (>>) :: m a -> m b -> m b
        x >> y = x >>= \_ -> y

    Très bonne modélisation du paradigme impératif
