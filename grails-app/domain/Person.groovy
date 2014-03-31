class Person {
    String userName

    static belongsTo = [ team : Team ]
    static mapping = {
        team lazy: true
    }
}
