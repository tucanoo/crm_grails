package com.tucanoo.crm

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.validation.ValidationException

class CustomerController {

    CustomerService customerService

    def index() {}

    def data_for_datatable() {
        int draw = params.int("draw")
        int length = params.int("length")
        int start = params.int("start")

        String dataTableOrderColumnIdx = params["order[0][column]"]
        String dataTableOrderColumnName = "columns[" + dataTableOrderColumnIdx + "][data]"

        String sortName = params[dataTableOrderColumnName] ?: "id"
        String sortDir = params["order[0][dir]"] ?: "asc"

        String queryString = params["search[value]"]

        PagedResultList criteriaResult = Customer.createCriteria().list([max: length, offset:start]) {
            readOnly true
            or {
                ilike('firstName', '%' + queryString + '%')
                ilike('lastName', '%' + queryString + '%')
                ilike('emailAddress', '%' + queryString + '%')
                ilike('city', '%' + queryString + '%')
                ilike('phoneNumber', '%' + queryString + '%')
            }
            order sortName, sortDir
        }

        Map dataTableResults = [
                draw: draw,
                recordsTotal: criteriaResult.totalCount,
                recordsFiltered: criteriaResult.totalCount,
                data: criteriaResult
        ]

        render dataTableResults as JSON
    }

    def create() {
        respond new Customer(params)
    }

    def save(Customer customerInstance) {
        try {
            customerService.save(customerInstance)
        } catch (ValidationException e) {
            respond customerInstance, view:'create'
            return
        }

        flash.message = "Customer created successfully"

        redirect(action: "index")

    }

    def edit(Long id) {
        respond customerService.get(id)
    }

    def update(Customer customer) {

        try {
            customerService.save(customer)
        } catch (ValidationException e) {
            respond customer.errors, view:'edit'
            return
        }

        flash.message = "Customer updated successfully!"

        redirect(action: "index")
    }

    def delete(Long id) {
        try {
            customerService.delete(id)

            flash.message = "Customer Deleted"
        } catch (Exception ex) {
            flash.message = "Could not delete customer"
        }

        redirect action:'index'
    }
}
