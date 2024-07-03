class McUrlApi {
  final url = 'https://vsms-v2-public.mceasy.com/v1';

  late String vehicle = '$url/vehicles';
  late String vehicleStatuses = '$url/vehicles/statuses'; // + withAddress=true
  late String trips = '$url/trips'; // + ?vehicleId
}
