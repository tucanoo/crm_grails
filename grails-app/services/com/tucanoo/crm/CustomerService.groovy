package com.tucanoo.crm

import grails.gorm.services.Service

@Service(Customer)
interface CustomerService {

    Customer get(Serializable id)

    void delete(Serializable id)

    Customer save(Customer customer)

}