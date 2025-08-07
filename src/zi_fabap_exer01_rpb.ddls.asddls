@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Exercisio 1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_EXER01_RPB
  as select from /dmo/flight  as Flight
    inner join   /dmo/carrier as Carrier on Flight.carrier_id = Carrier.carrier_id
{
  key Carrier.carrier_id    as CarrierId,
  key Flight.connection_id  as ConnectionId,
  key Flight.flight_date    as FlightDate,
      Flight.seats_max      as MaxSeats,
      Flight.seats_occupied as OccupiedSeats,
      concat(
             cast(cast((Flight.seats_occupied / Flight.seats_max * 100) as abap.dec(8,2)) as abap.char( 20 )),
             '%')           as OccupancyRate
      
}
