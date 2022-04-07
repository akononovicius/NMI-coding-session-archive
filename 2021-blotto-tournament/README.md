# Colonel Blotto Tournament

**The problem:** "In a distant, war-torn land, there are `10` castles. There
are two warlords: you and your archenemy. Each castle has its own strategic
value for a would-be conqueror. Specifically, the castles are worth `1`,
`2`, `3`, ... , `9`, and `10` victory points. You and your enemy each have
`100` soldiers to distribute, any way you like, to fight at any of the `10`
castles. Whoever sends more soldiers to a given castle conquers that castle
and wins its victory points. If you each send the same number of troops, you
split the points. You don't know what distribution of forces your enemy has
chosen until the battles begin. Whoever wins the most points wins the war."

This problem is not an original one, it was formulated as a contest for
readers of website FiveThirtyEight (hence the quotation marks).  The
FiveThirtyEight website is well known for providing forecasts of various
political and sports events. On a weekly basis it publishes "The Riddler"
column, which asks variety of questions meant to be answered using creative
thinking and/or computational methods.  We will use their post "[Can you
rule Riddler
nation?](https://fivethirtyeight.com/features/can-you-rule-riddler-nation)",
from which the above excerpt was taken, as a basis for our own tournament.

Originally Blotto game is a type of two-person constant-sum game studied by
Game Theory. In simple terms, Game Theory is a branch of mathematics that
studies strategic interactions between rational decision makers.  What is
fascinating about this game is that it is not known if it has an optimal
strategy. May be one of you will discover such strategy!

**The original competition** asked competitors to provide fixed battle plans
(vector of `10` numbers). Therefore the winner could be determined in a
single war.

For example, among the strategies used in the first competition were these
two:

```
A = [5, 12, 17, 13, 13, 11, 13, 5, 4, 7];
B = [3, 3, 13, 13, 3, 13, 13, 18, 3, 18];
```

In a war between these two strategies `B` would win. As warlord using `B`
strategy would control 6th, 8th and 10th castle (for `6+8+10=24` points). On
the other hand warlord using `A` strategy would control 1st, 2nd, 3rd, 5th
and 9th castle (`1+2+3+5+9=20` points). In 4th and 7th castle warlords would
be drawn (`(4+7)/2=5.5` points each). The final result would be `25.5` to
`29.5`.

**Our competition will be slightly different.** The winner will be the
warlord winning more wars in the `1001` war series against his opponent. As
in football, the winner will get `3` points and the loser `0` points, in
case of a draw both players will get `1` point. Deciding after that many
wars allows for random and adaptive strategies. Therefore you are encouraged
to formulate such strategies.

Your strategy should be implemented as a Matlab function accepting two
variables: matrix of plays made by you and matrix of plays made by your
opponent. Your function must return a vector, `V`, of `10` numbers. Each
`V(i)` is assumed to be a number of soldiers assigned to the castle worth
`i` points.

## Relevant materials

See [task file](./task.pdf) for more details. Or see the [YouTube
video](https://www.youtube.com/watch?v=jCt0Kc687jA) for my comments on how
the tournament software was implemented.
