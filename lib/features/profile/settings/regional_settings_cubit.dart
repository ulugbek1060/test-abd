import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/domain/account/entities/personal_info_dto.dart';
import 'package:testabd/features/profile/settings/regional_settings_state.dart';
import 'package:testabd/main.dart';

@injectable
class RegionalSettingsCubit extends Cubit<RegionalSettingsState> {
  final AccountRepository _accountRepository;
  final AppMessageHandler _appMessageHandler;

  late final StreamSubscription<void> _subscription;

  late PersonalInfoDto? _personalInfoDto;

  RegionalSettingsCubit(this._accountRepository, this._appMessageHandler)
    : super(RegionalSettingsState()) {
    // personal info data holder
    _personalInfoDto = PersonalInfoDto();

    _subscription = _accountRepository.userInfoStream.listen((event) {
      // update ui
      emit(
        state.copyWith(
          countries: state.countries.copyWith(selected: event?.country),
          regions: state.regions.copyWith(selected: event?.region),
          districts: state.districts.copyWith(selected: event?.district),
          settlement: state.settlement.copyWith(selected: event?.settlement),
        ),
      );

      // personal info data holder
      _personalInfoDto = _personalInfoDto?.copyWith(
        firstName: event?.firstName,
        lastName: event?.lastName,
        username: event?.username,
        bio: event?.bio,
        email: event?.email,
        phoneNumber: event?.phoneNumber,
      );

      if (event?.region?.id != null) fetchRegions(event?.country?.id);
      if (event?.district?.id != null) fetchDistricts(event?.region?.id);
      if (event?.settlement?.id != null) fetchSettlements(event?.district?.id);
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  Future<void> refresh() async {
    fetchCountries();
    fetchRegions(state.regions.selected?.id);
    fetchDistricts(state.districts.selected?.id);
    fetchSettlements(state.settlement.selected?.id);
  }

  Future<void> fetchCountries() async {
    if (state.countries.isLoading) return;

    emit(state.copyWith(countries: state.countries.copyWith(isLoading: true)));

    final result = await _accountRepository.getCountries();
    result.fold(
      (error) {
        emit(
          state.copyWith(
            countries: state.countries.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
        _appMessageHandler.handleDialog(error);
      },
      (value) {
        emit(
          state.copyWith(
            countries: state.countries.copyWith(
              isLoading: false,
              countries: value,
              selected: state.countries.selected?.id != null
                  ? state.countries.selected
                  : value.firstOrNull,
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchRegions(int? districtId) async {
    if (districtId == null) return;
    if (state.regions.isLoading) return;

    emit(state.copyWith(regions: state.regions.copyWith(isLoading: true)));

    final result = await _accountRepository.getRegions(districtId);

    result.fold(
      (error) {
        emit(
          state.copyWith(
            regions: state.regions.copyWith(
              isLoading: false,
              error: error.message,
            ),
          ),
        );
        _appMessageHandler.handleDialog(error);
      },
      (value) {
        emit(
          state.copyWith(
            regions: state.regions.copyWith(
              isLoading: false,
              regions: value,
              selected: state.regions.selected,
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchDistricts(int? regionId) async {
    if (regionId == null) return;
    if (state.districts.isLoading) return;

    emit(state.copyWith(districts: state.districts.copyWith(isLoading: true)));
    final result = await _accountRepository.getDistricts(regionId);
    result.fold(
      (error) {
        emit(
          state.copyWith(
            districts: state.districts.copyWith(
              error: error.message,
              isLoading: false,
            ),
          ),
        );
        _appMessageHandler.handleDialog(error);
      },
      (value) {
        emit(
          state.copyWith(
            districts: state.districts.copyWith(
              districts: value,
              isLoading: false,
              selected: state.districts.selected,
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchSettlements(int? settlementId) async {
    if (settlementId == null) return;
    if (state.settlement.isLoading) return;

    emit(
      state.copyWith(settlement: state.settlement.copyWith(isLoading: true)),
    );

    final result = await _accountRepository.getSettlements(settlementId);
    result.fold(
      (error) {
        emit(
          state.copyWith(
            settlement: state.settlement.copyWith(
              error: error.message,
              isLoading: false,
            ),
          ),
        );
        _appMessageHandler.handleDialog(error);
      },
      (value) {
        emit(
          state.copyWith(
            settlement: state.settlement.copyWith(
              error: null,
              isLoading: false,
              settlements: value,
              selected: state.settlement.selected,
            ),
          ),
        );
      },
    );
  }

  Future<void> selectCountry(int? id) async {
    if (id == null) return;
    final country = state.countries.countries.firstWhereOrNull(
      (e) => e.id == id,
    );
    if (country == null) return;
    emit(
      state.copyWith(
        countries: state.countries.copyWith(selected: country),
        regions: state.regions.copyWith(selected: null, regions: []),
        districts: state.districts.copyWith(selected: null, districts: []),
        settlement: state.settlement.copyWith(selected: null, settlements: []),
      ),
    );
    fetchRegions(id);
  }

  Future<void> selectRegion(int? id) async {
    if (id == null) return;
    final region = state.regions.regions.firstWhereOrNull((e) => e.id == id);
    if (region == null) return;
    emit(
      state.copyWith(
        regions: state.regions.copyWith(selected: region),
        districts: state.districts.copyWith(selected: null, districts: []),
        settlement: state.settlement.copyWith(selected: null, settlements: []),
      ),
    );
    fetchDistricts(id);
  }

  Future<void> selectDistrict(int? id) async {
    if (id == null) return;
    final district = state.districts.districts.firstWhereOrNull(
      (e) => e.id == id,
    );
    if (district == null) return;
    emit(
      state.copyWith(
        districts: state.districts.copyWith(selected: district),
        settlement: state.settlement.copyWith(selected: null, settlements: []),
      ),
    );
    fetchSettlements(id);
  }

  Future<void> selectSettlement(int? id) async {
    if (id == null) return;
    final settlement = state.settlement.settlements.firstWhereOrNull(
      (e) => e.id == id,
    );
    if (settlement == null) return;
    emit(
      state.copyWith(
        settlement: state.settlement.copyWith(selected: settlement),
      ),
    );
  }

  Future<void> toggleEditableMode() async =>
      emit(state.copyWith(isEditable: !state.isEditable));

  Future<void> save() async {
    if (state.isLoading) return;
    if (_personalInfoDto == null) return;

    if (state.countries.selected == null) {
      _appMessageHandler.handleSnackBar(UnknownErrorMsg('Select country'));
      return;
    }

    if (state.regions.selected == null) {
      _appMessageHandler.handleSnackBar(UnknownErrorMsg('Select region'));
      return;
    }

    if (state.districts.selected == null) {
      _appMessageHandler.handleSnackBar(UnknownErrorMsg('Select district'));
      return;
    }

    if (state.settlement.selected == null) {
      _appMessageHandler.handleSnackBar(UnknownErrorMsg('Select settlement'));
      return;
    }

    _personalInfoDto = _personalInfoDto?.copyWith(
      country: state.countries.selected,
      region: state.regions.selected,
      district: state.districts.selected,
      settlement: state.settlement.selected,
    );

    emit(state.copyWith(isLoading: true));

    final result = await _accountRepository.updatePersonalInfo(
      _personalInfoDto!,
    );

    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false));
        _appMessageHandler.handleDialog(error);
      },
      (value) {
        emit(state.copyWith(isLoading: false));
      },
    );
  }

}
