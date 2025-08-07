@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Exercisio 2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_EXER02_RPB
  as select from /dmo/connection as Connection
    inner join   /dmo/carrier    as Carrier on Connection.carrier_id = Carrier.carrier_id
{
  key Connection.carrier_id    as CarrierId,
      Carrier.name             as Name,
      count( distinct Connection.connection_id )                 as Conta,
      max(Connection.distance) as MaxDistance
}
group by
  Connection.carrier_id,
  Carrier.name
