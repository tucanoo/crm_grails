package com.tucanoo.crm

class Customer {

    String firstName
    String lastName
    String emailAddress
    String address
    String city
    String country
    String phoneNumber

    static constraints = {
        firstName blank: false
        lastName blank: false
        emailAddress nullable: true
        address nullable: true
        city nullable: true
        country nullable: true
        phoneNumber nullable: true
    }

    static mapping = {
        version false
    }
}
