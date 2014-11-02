void functionRefInference() {
    @type:"Iterable<Tuple<Integer,Integer,Empty>,Nothing>" value r1 
            = [1, 2, 3].map([].withTrailing);
    @type:"Integer" value product1 = [1, 2, 3].reduce(times);
    @type:"Float" value product2 = [1.0, 2.0, 3.0].reduce(times);
    @error value product3 = [1, 2, 3, 1.2].reduce(times);
    @error value product4 = ["1", "2"].reduce(times);
    @type:"String" value sum1 = ["1", "2"].reduce(plus);
    @type:"Integer" value sum2 = [1, 2, 3].fold(0)(plus);
    @error value sum2 = [1, 2, 3.0].fold(1)(times);
    @type:"Iterable<Singleton<Integer|Float>,Nothing>" value singletons1
            = [1, 2, 1.0, 2.0].map(Singleton);
    value singletons2 = [1, null, 2, null, 1.0, null, 2.0].map { 
        collecting = emptyOrSingleton; 
    };
}
