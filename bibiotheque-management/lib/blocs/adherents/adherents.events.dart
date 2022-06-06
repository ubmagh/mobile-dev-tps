
abstract class AdherentsEvent{}

class GetAdherentsEvent extends AdherentsEvent{}


class DeleteAdherentEvent extends AdherentsEvent{
  int adherent_id;
  DeleteAdherentEvent({required this.adherent_id});
}

