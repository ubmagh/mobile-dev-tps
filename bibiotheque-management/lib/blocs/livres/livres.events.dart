
abstract class LivresEvents{}

class GetLivresEvent extends LivresEvents{}

class SearchLivresEvent extends LivresEvents{
  String keyword;
  SearchLivresEvent({required this.keyword});
}


class DeleteLivreEvent extends LivresEvents{
  int livre_id;
  DeleteLivreEvent({required this.livre_id});
}

