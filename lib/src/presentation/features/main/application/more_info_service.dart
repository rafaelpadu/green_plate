import 'package:green_plate/src/data/repositories/customer_repository.dart';
import 'package:green_plate/src/domain/model/DTOs/customer_dto.dart';

class MoreInfoService {
  CustomerRepository customerRepository = CustomerRepository();

  Future<CustomerDTO> getCustomerByUserId() {
    return customerRepository.getCustomerByUserId();
  }

  Future<CustomerDTO> updateCustomer(CustomerDTO customerDTO) {
    return customerRepository.updateCustomer(customerDTO);
  }
}
