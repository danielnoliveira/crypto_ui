enum eRangeTime { OneHour, OneDay, OneWeek, OneMonth, OneYear }

extension ToolsRangeTime on eRangeTime {
  String getLabel() {
    switch (this) {
      case eRangeTime.OneHour:
        return '1h';

      case eRangeTime.OneDay:
        return '1d';

      case eRangeTime.OneWeek:
        return '1w';

      case eRangeTime.OneMonth:
        return '1m';

      case eRangeTime.OneYear:
        return '1y';
    }
  }

  int getNumberOfSpots() {
    switch (this) {
      case eRangeTime.OneHour:
        return 51;

      case eRangeTime.OneDay:
        return 101;

      case eRangeTime.OneWeek:
        return 151;

      case eRangeTime.OneMonth:
        return 201;

      case eRangeTime.OneYear:
        return 301;
    }
  }
}
