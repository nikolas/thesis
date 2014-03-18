%% -*- mode: LaTeX; compile-command: "mk" -*-

%include polycode.fmt

\chapter{Combinatorial species}
\label{chap:species}

\begin{itemize}
\item Motivate application of the theory of species by starting
  (mostly) ``from scratch'' and building up the pieces of the theory
  we need.
\end{itemize}

\begin{itemize}
\item Develop more general definitions along the way.  Applies not
  just to \Set\ but also to category of types and functions, etc.
\item Lifting monoidal structure from $C$: sum, Cartesian/Hadamard product.
\item Day convolution.  Cauchy product.  Arithmetic product.
\item Composition.
\end{itemize}

\section{Foundations}
\label{sec:foo}

Denote by $\B$ the category whose objects are finite sets and whose
morphisms are bijections between finite sets.  Species are then
defined as functors $\B \to \Set$.  Intuitively, the action of a
species on objects takes a finite set of ``labels'' to a set of
``structures''; the action on morphisms requires the action on objects
to be ``invariant under relabelling''.

This is a simple and convenient definition, but there are several
reasons that compel us to generalize it.  First, $\B$ and $\Set$ enjoy
many special properties as categories (for example, $\Set$ is
cartesian closed, has all limits and colimits, and so on).  It is
enlightening to see precisely which properties are required in which
situations, and we miss this entirely if we start with the kitchen
sink.

More subtly, we wish to work in a constructive, computational setting,
and the specific categories $\B$ and $\Set$ are inappropriate.  Before
returning to generalize species, we must take a small detour to see
one reason why $\B$ is inappropriate in a computational setting, and
the definitions of some more appropriate tools.

\subsection{Constructive groupoids}
\label{sec:constructive-groupoids}

Let $\fin n \defeq \{0, \dots, n-1\}$ be the set of the first $n$ natural
numbers.  Denote by $\P$ the category whose objects are natural
numbers and whose morphisms $\mor m n$ are bijections $\fin m \bij \fin
n$ (hence there are no morphisms $\mor m n$ unless $m \equiv n$).  Often it
is noted as a triviality not requiring proof that $\P$ is equivalent
to (in fact, a skeleton of) $\B$ and hence we are justified in working
with $\P$ rather than $\B$ when convenient.

However, upon digging a bit deeper it is not quite so trivial: in
particular, showing that $\P$ and $\B$ are (strongly) equivalent
requires the axiom of choice.  In more detail, it is easy to define a
functor $\fin - : \P \to \B$ which sends $n$ to $\fin n$ and preserves
morphisms.  Defining an inverse functor $\B \to \P$ is more
problematic. Clearly we must send each set $S$ to its size
$\size S$. However, a morphism $S \bij T$ must be sent to some bijection
$\fin{\size S} \bij \fin{\size T}$, and intuitively we have no way to pick one: we
would need to decide on a way to match up the elements of each set $S$
with the set of natural numbers $\fin{\size S}$.  In a sense it ``does not
matter'' what choice we make, since the results will be isomorphic in
any case, and this is precisely where the axiom of choice comes in.

\todo{Note that HoTT can express several variants on AC.  Some are
inherently non-constructive so we do not want to assert them.  Note
there is one variant which is simply provable, but in order to apply
it we need to already have evidence of a correspondence between
arbitrary finite sets and canonical finite sets of the same size.}

This leads us to the need for \emph{computational evidence of
  finiteness}.  (Even the phrase ``send each set $S$ to its size
$\size S$'' should have been suspect before.  Where does this size
actually come from?)

First, we define a counterpart to $\P$ in type theory:
\begin{defn}
  $\PT$ is the groupoid where
  \begin{itemize}
  \item the objects are natural numbers, that is, values of type $\N$, and
  \item the morphisms $\mor m n$ are equivalences of type $\Fin m \iso
    \Fin n$.
  \end{itemize}
\end{defn}

\newcommand{\tygrpd}[1]{\ensuremath{\mathbf{G}(#1)}}

We now note the general principle that any type $T$ gives rise to a
groupoid $\tygrpd{T}$ where the objects are values $a : T$, and
$\tygrpd{T}(a,b) \defeq a = b$, that is, morphisms from $a$ to $b$ are
paths $p : a = b$.  As a first try at defining a constructive
counterpart to $\B$, we consider $\tygrpd{\FinType}$, where
\[ \FinType \defeq (A : \Type) \times (n : \N) \times (\Fin n \iso
A). \] However, this does not work: the explicit evidence of
finiteness is too strong, and interferes with the groupoid
structure. \todo{Explain why.  Can show there is at most one
  inhabitant of $A = B$ for $A, B : \FinTypeT$.  Use triangle
  picture.}

The next thing to try is thus $\tygrpd{\FinTypeT}$, where \[ \FinTypeT
\defeq (A : \Type) \times (n : \N) \times \ptrunc{\Fin n \iso A} \]
This does give us the right groupoid structure, and we can prove that
it is equivalent to $\PT$---as long as equivalence of categories is a
mere proposition! \todo{explain why} Equivalence as a mere proposition
is not all that useful, however. We want to define a functor
$\tygrpd{\FinTypeT} \to \PT$ that we can actually compute with, but
we cannot since it needs the equivalences in a computationally
relevant way.

In the end, we are forced to give up on constructing a groupoid via
$\tygrpd{-}$, and define $\BT$ as follows.

\begin{defn}
$\BT$ is the groupoid where
\begin{itemize}
\item the objects are values of type $\FinType \defeq (A : \Type) \times (n : \N)
\times (\Fin n \iso A)$, and
\item morphisms $\mor{(A,m,i)}{(B,n,j)}$ are equivalences $A \iso B$.
\end{itemize}
\end{defn}

That is, morphisms simply ignore the equivalences contained in
objects.

\begin{rem}
  Note that given a morphism $e : \mor {(A,m,i)} {(B,n,j)}$, it is
  provably the case that $m \equiv n$.  In particular, $i \then e \then j^{-1} :
  \Fin m \iso \Fin n$, from which we may prove $m \equiv n$ by double
  induction.
\end{rem}

\begin{rem}
  This may seem a bit funny: we go to the trouble of adding extra
  computational evidence to objects, but then the next minute we turn
  around and say that the additional evidence is irrelevant after all!
  However, the point is that although the extra evidence may be
  irrelevant to \emph{morphisms}, functors out of the category may
  still make use of it (see \pref{defn:size}).  Instead of having to
  make an arbitrary choice of isomorphism when mapping out of an
  object, we ``blow up'' the category by making a separate object for
  each possible choice, but ensure that objects which differ only by
  this choice are isomorphic.
\end{rem}

\begin{defn}
We can now define a functor $\fin - : \PT \to \BT$ in the evident way:
\begin{itemize}
\item On objects, $\fin n \defeq (\Fin n, n, \id)$.
\item $\fin -$ is the identity on morphisms.
\end{itemize}
\end{defn}

\begin{defn} \label{defn:size}
In the other direction, we define $\size{} : \BT \to \PT$:
\begin{itemize}
\item On objects, $\size{(A, m, i)} \defeq m$.
\item On morphisms, $e : \mor {(A, m, i)} {(B, n, j)}$ is sent to \[
  \xymatrix{\Fin m \ar@@{<->}[d]_-i & \Fin n \\ A \ar@@{<->}[r]_e & B
    \ar@@{<->}[u]_-{j^{-1}} } \]
\end{itemize}
\end{defn}

\begin{rem}
  Note in particular how we make use of the extra computational
  evidence present in objects to define $\size{}$ without resorting to
  choice.
\end{rem}

\begin{prop}
  The functors $\xymatrix{\PT \ar@@<.5ex>[r]^{\fin -} & \BT \ar@@<.5ex>[l]^{\size{}}}$ constitute a
  (strong) equivalence between the groupoids $\PT$ and $\BT$.

\begin{proof}
  $\size{\fin -}$ is by definition the identity functor.  The
  interesting direction is $\fin{\size -}$.
  \begin{itemize}
  \item On objects, $\fin{\size {(A,m,i)}} \equiv \fin{m} \equiv (\Fin
    m, m, \id)$, and
  \item on morphisms, $e : \mor {(A,m,i)} {(B,n,j)}$ is sent to
    $\fin{\size e} \equiv \fin{i \then e \then j^{-1}} \equiv i \then e \then j^{-1}$.
  \end{itemize}
  We must exhibit a natural isomorphism $\alpha : \nat{Id}{\fin{\size
      -}}$.  The component of $\alpha$ at $(A,m,i)$ must be a morphism
  in $\BT$ from $(A,m,i)$ to $(\Fin m, m, \id)$, that is, an
  equivalence $A \iso \Fin m$.  Therefore we define \[
  \alpha_{(A,m,i)} \defeq i^{-1}. \]  Naturality of $\alpha$ is given
  by the diagram
  \[ \xymatrix{
         (A,m,i) \ar[r]^-{i^{-1}} \ar[d]_e
         &
         (\Fin m, m, \id) \ar[d]^{i \then e \then j^{-1}}
       \\
         (B,n,j) \ar[r]_-{j^{-1}} & (\Fin n, n, \id)
     }
  \]
  which commutes by inspection.  Finally, we note that any natural
  transformation between functors whose codomain is a groupoid is
  automatically an isomorphism.
\end{proof}

\end{prop}