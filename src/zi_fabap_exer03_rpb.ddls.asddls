@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Exercisio 3'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_EXER03_RPB
  as select from /dmo/customer as Customer
{
    key Customer.customer_id as CustomerId,
    Customer.first_name as FirstName,
    Customer.last_name as LastName,
    Customer.city as City,
    Customer.street as Street,
    Customer.country_code as CountryCode,
    concat_with_space(concat_with_space(concat_with_space(concat(Customer.street, ','),
            Customer.city,1),'-',1),Customer.country_code,1) as Adress
}
