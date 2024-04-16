class Transactions {
  static List getTrans() {
    var recent = [
      {
        "id": 1,
        "icon":
            "https://freelogopng.com/images/all_img/1690643640twitter-x-icon-png.png",
        "title": "Twitter Campaign",
        "description": "Debit your account for Twitter Campaign",
        "amount": 3000,
        "type": "debit",
        "date": 1713260337,
      },
      {
        "id": 2,
        "icon":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png",
        "title": "Instagram Campaign",
        "description": "Debit your account for Instagram Campaign",
        "amount": 2000,
        "type": "credit",
        "date": 1713260337,
      },
      {
        "id": 2,
        "icon":
            "https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png",
        "title": "Youtube Campaign",
        "description": "Debit your account for Youtube Campaign",
        "amount": 200,
        "type": "debit",
        "date": 1713260337,
      },
    ];
    return recent;
  }
}
