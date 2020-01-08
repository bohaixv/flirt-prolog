/* food_type(veleeta , cheese).
food_type(ritz, racker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).
flavor(sweet, dessert).
flavor(savory, meat).
flavor(savory, cheese).
flavor(sweet, soda).
food_flavor(X, Y) :- food_type(X, Z) , flavor(Y, Z). */

/* 合一  */
cat(lion).
cat(tiger).

dorothy(X, Y, Z) :- X=lion, Y=tiger, Z=monkey.
twins_cat(X, Y) :- cat(X), cat(Y).

/* 记录作者和书 */
writes(motime, howToReadABook).
writes(mokty, wayFewPeopleWalk).
writes(lePang, peopleSoBad).
writes(kaLeDe, peopleCatchBike).
writes(motime, thousandsYears).
writes(motime, redBuildingDream).
writes(motime, threeBody).
writes(lePang, outControl).
writes(lePang, walkInDay).

writer(X, Y) :- writes(X, Y).

/* 这个是递归 递归我会  而且也存在一个叫做尾递归的东西 */
father(jack, jame).
father(jame, jole).
father(jole, jeter).
father(jeter, jason).
father(jason, jimy).
father(jimy, jocla).
father(jocla, jiccy).

ancestor(X, Y) :- father(X, Y).
ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).

/**  基本数据类型  数组和元组 */
/* 元组 */
(1, 2, 3) = (1, 2, 3).
(1, 2, 3) = (A, B, C).

/* 数组 */
[1,2,3] = [1,2,3].
[1,2,3] = [A,B,C].

/* 数组的解构 */
[1,2,3] = [Head | Tail].
[1,2,3] = [1 | [Head | Tail]].

/* _是一个通配符，这个通配符可以匹配任何数据 */
[1,2,3] = [_, _ | [Head| Tail]].

/* 递归的实际应用场景 */
count(0, []).
count(Count , [Head | Tail]) :- count(TailCount , Tail) , Count is TailCount + 1.

sum(0, []).
sum(Total, [Head | Tail]) :- sum(Sum, Tail) , Total is Sum + Head.

average(Average , List) :- sum(Sum, List) , count(Count, List) , Average is Sum / Count.

/**  append函数的实现方式很巧妙的  */
concatenate([], List, List).
concatenate([Head | Tail1] , List, [Head | Tail2]) :- concatenate(Tail1 , List, Tail2).

